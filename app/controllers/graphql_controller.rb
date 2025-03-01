class GraphqlController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  # after_action :verify_authorized

  attr_reader :current_user
  before_action :authenticate_user

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
      pundit: self
    }
    result = ErstigameBackendSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  # NB: allow to call authorize from graphql
  def authorize(*args)
    super
  end

  # NB: allow to call policy_scope from graphql
  def policy_scope(*args)
    super
  end

  def unauthorized
    render json: { success: false, message: "unauthorized" }
  end

  protected

  def authenticate_user
    token = request.headers['Authorization']&.gsub(/Bearer /, '')
    @current_user ||= User.find_by auth_token: token
    @current_user&.touch 
    # head(:unauthorized) && (return false) unless @current_user.present?
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
