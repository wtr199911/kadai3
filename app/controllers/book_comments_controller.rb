class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
    else
     @book_new = Book.new
     @user_info = @book.user
     @books = Book.all
     render 'books/show'
    end
  end


  def destroy
    @comment = BookComment.find(params[:id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
