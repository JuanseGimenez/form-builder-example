class Task < ApplicationRecord
  validates :title, :description, :user, presence: true
  validates :title, length: { minimum: 5 }
end
