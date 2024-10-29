class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
  @existing_book = Book.find(params[:id])
  impressionist(@existing_book) # 閲覧数をカウント
  @user = @existing_book.user # ここで関連するユーザーを取得
  @book = Book.new
  @book_comment = BookComment.new
  
  end

  def index
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    
    # 並び替え条件に応じて異なる並び替えを実行
    @books = case params[:sort]
             when "rating"
               Book.order(score: :desc)
             when "new"
               Book.order(created_at: :desc)
             else
               # お気に入り順（デフォルト）
               Book.includes(:week_favorites).sort_by { |book| -book.week_favorites.count }
             end

    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :score)
  end
  
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
