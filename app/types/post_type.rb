# require_relative 'comment_type.rb'
#
# module Types
#
# module PostType
#   def self.define
#     GraphQL::ObjectType.define do
#       name "Post"
#       description "A blog post"
#
#       field :id, !types.ID
#       field :title, !types.String
#       field :body, !types.String
#       field :comments, types[!Types::CommentType.define]
#     end
#   end
# end
#
# end

PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :comments, types[!CommentType]
end
