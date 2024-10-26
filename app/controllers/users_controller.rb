class UsersController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @total_views = @user.books.sum(&:impressionist_count)
    @book = Book.new
    
  today = Date.today
  yesterday = today - 1
  start_of_week = today.beginning_of_week
  start_of_last_week = start_of_week - 1.week
    
  @today_books_count = @user.books.where(created_at: today.all_day).count
  @yesterday_books_count = @user.books.where(created_at: yesterday.all_day).count
  @weekly_books_count = @user.books.where(created_at: start_of_week..today).count
  @last_week_books_count = @user.books.where(created_at: start_of_last_week..start_of_week - 1.day).count

  @difference_today_yesterday = @today_books_count - @yesterday_books_count
  @difference_weekly = @weekly_books_count - @last_week_books_count
  
  end
  

  def index
    @users = User.all
    @book = Book.new
  end
  
  def edit
    
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
