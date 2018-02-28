module Service
module Mutation

module NewPost

  def self.main(title, body)
    Model::Post.where(title: title, body: body).create
  end

end

end
end
