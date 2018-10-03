class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, {presence: true}
  validates :post_id, {presence: true}

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

#  validates_uniqueness_of :post_id, scope: :user_id
end
