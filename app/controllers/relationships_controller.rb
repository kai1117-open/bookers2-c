class RelationshipsController < ApplicationController
  before_action :authenticate_user!
# フォローするアクション
def create
  # フォロー対象のユーザーを取得する（params[:user_id]で指定されたユーザーIDを基に検索）
  user = User.find(params[:user_id])
  # 現在ログインしているユーザーが取得したユーザーをフォローする
  current_user.follow(user)
  # 元のページにリダイレクト（リクエストが発生したページに戻る）
  redirect_to request.referer
end

# フォロー解除するアクション
def destroy
  # フォロー解除対象のユーザーを取得する（params[:user_id]で指定されたユーザーIDを基に検索）
  user = User.find(params[:user_id])
  # 現在ログインしているユーザーが取得したユーザーをフォロー解除する
  current_user.unfollow(user)
  # 元のページにリダイレクト（リクエストが発生したページに戻る）
  redirect_to request.referer
end

# フォロー中のユーザー一覧を表示するアクション
def followings
  # フォロー中のユーザーを取得する対象のユーザーを検索する（params[:user_id]で指定されたユーザーIDを基に検索）
  user = User.find(params[:user_id])
  # 指定されたユーザーがフォローしているユーザーの一覧を取得
  @users = user.followings
end

# フォロワーの一覧を表示するアクション
def followers
  # フォロワーを取得する対象のユーザーを検索する（params[:user_id]で指定されたユーザーIDを基に検索）
  user = User.find(params[:user_id])
  # 指定されたユーザーをフォローしているユーザーの一覧を取得
  @users = user.followers
end

end