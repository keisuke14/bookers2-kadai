class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comments = @book.book_comments
    @book_comment.save
  end

  def destroy
    # Bookcomment.find_by(id: params[:id]).destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    #redirect_to book_path(params[:book_id])
  end

   private
  def book_comment_params
    params.require(:book_comment).permit(:body)
  end

end
