class Event < ApplicationRecord
  belongs_to :group
  validates :title, presence: true
  validates :body, presence: true
end
