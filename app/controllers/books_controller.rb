class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    # @favorite = favorite.new
    @book_comments = @book.book_comments
  end

  def index
    @books = Book.all
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
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if current_user.id = @book.user_id
      if @book.update(book_params)
        redirect_to book_path(@book), notice: "You have updated book successfully."
      else
        render "edit"
      end
    else
      redirect_to book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    # { "book"=>{"title"=>"hoge", "body"=>"hoge"} }
    # { "title"=>"hoge", "body"=>"hoge" }
    params.require(:book).permit(:title, :body)
  end
end


