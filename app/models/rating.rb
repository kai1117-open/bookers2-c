class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :score, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :book_id }
end
