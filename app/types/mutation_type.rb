MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description "The mutation root of this schema"

  field :new_post do
    description "Find a Post by ID"
    type PostType
    argument :title, !types.String
    argument :body, !types.String

    resolve ->(obj, args, ctx) do
      Service::Mutation::NewPost.main(args["title"], args["body"])
      # Model::Post.where(title: args["title"], body: args["body"]).create
    end
  end

  field :new_comment do
    description "Create a new Comment"
    type PostType
    argument :post_id, !types.ID
    argument :comment, !types.String

    resolve ->(obj, args, ctx) do
      Service::Mutation::NewComment.main(args["post_id"], args["comment"])
      # post = Model::Post.find(args["post_id"])
      # comment = Model::Comment.where(body: args["comment"]).create!
      # post.comments << comment
      #
      # post
    end
  end

  field :update_comment do
    description "Update a Comment by ID"
    type CommentType
    argument :id, !types.ID
    argument :body, !types.String

    resolve ->(obj, args, ctx) do
      Service::Mutation::UpdateComment.main(args["id"], args["body"])
      # #update data
      # Model::Comment.find(args["id"])
      #         .update(body: args["body"])
      #
      # #return data
      # Model::Comment.find(args["id"])
    end
  end

end
