class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true
  validates :body, presence: true
end
