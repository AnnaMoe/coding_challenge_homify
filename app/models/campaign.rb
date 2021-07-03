class Campaign < ApplicationRecord
  belongs_to :expert, class_name: "User", foreign_key: "expert_id"
  has_many :todos
end
