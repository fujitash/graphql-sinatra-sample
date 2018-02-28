require 'mongoid'
Mongoid.load!('config/mongoid.yml')

module Model

class Post
  include Mongoid::Document

  field :title,     type: String
  field :body,      type: String
  has_many :comments

  validates :title, presence: true
  validates :title, uniqueness: false
  validates :body,  presence: true
  validates :body,  uniqueness: false
end

class Comment
  include Mongoid::Document

  field :body,  type: String
  belongs_to :post

  validates :body, presence: true
  validates :body, uniqueness: false
end

end
