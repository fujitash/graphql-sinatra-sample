module Service
module Query

module Comment

  def self.main(id)
    Model::Comment.find(id)
  end

end

end
end
