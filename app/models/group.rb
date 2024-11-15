class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :group_memberships
  has_many :members, through: :group_memberships, source: :user
  has_many :events, dependent: :destroy
  validates :name, presence: true
end
