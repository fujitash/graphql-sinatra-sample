# module Types
#
# module CommentType
#   def self.define
#     GraphQL::ObjectType.define do
#       name "Comment"
#
#       field :id, !types.ID
#       field :body, !types.String
#     end
#   end
# end
#
# end

CommentType = GraphQL::ObjectType.define do
  name "Comment"

  field :id, !types.ID
  field :body, !types.String
end
