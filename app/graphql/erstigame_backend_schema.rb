class ErstigameBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.id_from_object(object, type_definition, _)
    GraphQL::Schema::UniqueWithinType.encode type_definition.graphql_name, object.id
  end

  def self.object_from_id(id, context)
    return unless id

    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode id
    return unless type_name && item_id

    model_class = type_name.sub "Type", ""

    return unless const_defined? model_class

    object = model_class.constantize.find_by id: item_id
    context[:pundit].authorize object, :show?
  end

  def self.resolve_type(_, object, _)
    type_class = "Types::#{object.class}Type"
    return type_class.constantize if const_defined? type_class
  end

end
