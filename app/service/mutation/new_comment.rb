module Service
module Mutation

module NewComment

  def self.main(post_id, comment)
    post = Model::Post.find(post_id)
    new_comment = Model::Comment.where(body: comment).create!
    post.comments << new_comment

    post
  end

end

end
end
