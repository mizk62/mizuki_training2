class Post < ApplicationRecord
  mount_uploader :img, ::ImgUploader

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  belongs_to :user

  validates :user_id,{presence: true}

  def like(user)
    self.likes.find_by(user_id: user.id)
  end
end
