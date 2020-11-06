class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :books

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}


  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end

  has_many :relationships, foreign_key: "follower_id"
  has_many :followings, through: :relationships, source: :followed
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :followers, through: :reverse_of_relationships, source: :follower


  def follower(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(followed_id: other_user.id)
    end
  end

  def unfollower(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

end


