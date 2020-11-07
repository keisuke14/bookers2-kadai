class SearchController < ApplicationController
 def index
    method = params[:search_method]
    @word = params[:search_word]
    model = params[:search_model]
    if model == 'User'
      @users = User.search(method,@word)
    else
      @books = Book.search(method,@word)
    end
 end
end
