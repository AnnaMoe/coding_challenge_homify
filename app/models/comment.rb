class Comment < ApplicationRecord
  belongs_to :receiver, polymorphic: true
end
