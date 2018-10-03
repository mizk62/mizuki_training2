class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true

  def self.message_list
    return Comment.all.order(:created_at => :desc)
  end
end
