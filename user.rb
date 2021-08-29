class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }

         has_many :books, dependent: :destroy
         has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book
  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end
end
