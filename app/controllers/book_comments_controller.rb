class BookCommentsController < ApplicationController
  
 def create
  @existing_book = Book.find(params[:book_id])
  @comment = current_user.book_comments.new(book_comment_params)
  @comment.book_id = @existing_book.id
    @comment.save
 end

def destroy
  @existing_book = Book.find(params[:book_id])
  @book_comment = BookComment.find(params[:id])
  @book = @book_comment.book
  @book_comment.destroy
end



  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  
  
end
