module Service
module Mutation

module UpdateComment

  def self.main(id, body)
    #update data
    Model::Comment.find(id).update(body: body)

    #return data
    Model::Comment.find(id)
  end

end

end
end
