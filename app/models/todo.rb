class Todo < ApplicationRecord
  # belongs_to :expert, class_name: "User", foreign_key: "expert_id"
  # belongs_to :novice, class_name: "User", foreign_key: "novice_id"
  belongs_to :campaign
  belongs_to :user
  has_many :comments, as: :receiver
  validates :name, presence: true
end
