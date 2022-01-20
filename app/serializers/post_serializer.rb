class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :comments

  belongs_to :user
  # has_many :comments

  def comments
    {
      count: object.comments.count
    }
  end
end
