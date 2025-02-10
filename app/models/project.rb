class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: %w[New In\ Progress In\ Review Completed], message: "%{value} is not a valid status" }
end
