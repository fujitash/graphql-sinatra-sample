module Service
module Query

module Post

  def self.main(id)
    Model::Post.find(id)
  end

end

end
end
