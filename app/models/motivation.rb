class Motivation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :user, optional: true
  belongs_to :category
  has_one_attached :image
  has_many :comments
  has_many :favorites, dependent: :destroy #投稿が消えるといいねも消える

  validates :title, presence: true
  validates :purchase_date, presence: true
  validates :purpose, presence: true
  validates :image, presence: true
  
  
  validates :category_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      Motivation.where('title  LIKE(?)', "%#{search}%")
    else
      Motivation.all
    end
  end

  # def favorited?(user)
  #   favorites.where(user_id: user.id).exists? #favorited?(user)として、メソッドに引数を指定する。→次のステップでcurrent_userを指定する
  # end                                         #その引数(current_user)のidと等しいuser_idを持つレコードは、favoritesテーブル内に存在するか？」をexists?を用いて判断する

 
 

end
