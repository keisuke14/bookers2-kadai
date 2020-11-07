class Book < ApplicationRecord
	# has_many :user
  belongs_to :user

  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	 def self.search(method,word)
    if  method == "perfect_match"
            @books = Book.where(title: "#{word}")
    elsif method == "forward_match"
            @Books = Book.where("title LIKE ?","#{word}%")
    elsif method == "backward_match"
            @books = Book.where("title LIKE ?","%#{word}")
    elsif method == "partial_match"
            @books = Book.where("title LIKE ?","%#{word}%")
    else
            @books = Book.all
    end
  end
end

