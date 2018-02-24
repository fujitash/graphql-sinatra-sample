require 'rubygems'
require 'sinatra/base'
require 'graphql'
require_relative 'model'

class SampleApp < Sinatra::Base

  configure do
    PostType = GraphQL::ObjectType.define do
      name "Post"
      description "A blog post"

      field :id, !types.ID
      field :title, !types.String
      field :body, !types.String
      field :comments, types[!CommentType]
    end

    CommentType = GraphQL::ObjectType.define do
      name "Comment"

      field :id, !types.ID
      field :body, !types.String
    end

    QueryType = GraphQL::ObjectType.define do
      name "Query"
      description "The query root of this schema"

      field :comment do
        description "Find a Comment by ID"
        type CommentType
        argument :id, !types.ID

        resolve ->(obj, args, ctx) { Comment.find(args["id"]) }
      end

      field :post do
        description "Find a Post by ID"
        type PostType
        argument :id, !types.ID

        resolve ->(obj, args, ctx) { Post.find(args["id"]) }
      end

    end

    MutationType = GraphQL::ObjectType.define do
      name 'Mutation'
      description "The mutation root of this schema"

      field :new_post do
        description "Find a Post by ID"
        type PostType
        argument :title, !types.String
        argument :body, !types.String

        resolve ->(obj, args, ctx) do
          Post.where(title: args["title"], body: args["body"]).create
        end
      end

      field :update_comment do
        description "Update a Comment by ID"
        type CommentType
        argument :id, !types.ID
        argument :body, !types.String

        resolve ->(obj, args, ctx) do
          #update data
          Comment.find(args["id"])
                  .update(body: args["body"])

          #return data
          Comment.find(args["id"])
        end
      end

      field :new_comment do
        description "Create a new Comment"
        # type CommentType
        type PostType
        argument :post_id, !types.ID
        argument :comment, !types.String

        resolve ->(obj, args, ctx) do
          post = Post.find(args["post_id"])
          comment = Comment.where(body: args["comment"]).create!
          post.comments << comment

          post
        end
      end

    end

    Schema = GraphQL::Schema.define do
      query QueryType
      mutation MutationType
    end
  end

  post '/graphql' do
    req = JSON.parse(request.body.read)
    Schema.execute(req['query']).to_json
  end

end

run SampleApp
