CommentType = GraphQL::ObjectType.define do
  name "Comment"

  field :id, !types.ID
  field :body, !types.String
end
