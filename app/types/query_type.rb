QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :comment do
    description "Find a Comment by ID"
    type CommentType
    argument :id, !types.ID

    resolve ->(obj, args, ctx) { Service::Query::Comment.main(args["id"]) }
  end

  field :post do
    description "Find a Post by ID"
    type PostType
    argument :id, !types.ID

    resolve ->(obj, args, ctx) { Service::Query::Post.main(args["id"]) }
  end

end
