# app/models/relationship.rb
class Relationship < ApplicationRecord
  # フォロワー（フォローする側）とフォローされる側のユーザーに対するアソシエーションを定義
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # バリデーション
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
