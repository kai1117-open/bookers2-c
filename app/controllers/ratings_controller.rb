class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    if @book.ratings.create(user: current_user, score: params[:score])
      redirect_to @book, notice: '評価が追加されました。'
    else
      redirect_to @book, alert: '評価の追加に失敗しました。'
    end
  end
end