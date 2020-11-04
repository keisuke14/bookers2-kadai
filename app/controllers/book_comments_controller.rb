class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @books = Book.all
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      redirect_to book_path(@book)
    else
      render 'show'
    end
  end

  def destroy
    # Bookcomment.find_by(id: params[:id]).destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    redirect_to book_path(params[:book_id])
  end

   private
  def book_comment_params
    params.require(:book_comment).permit(:body)
  end

end
