class Motivation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1 }

  has_many :notifications
  belongs_to :user, optional: true
  belongs_to :category
  has_one_attached :image

  validates :title, presence: true
  validates :purchase_date, presence: true
  validates :purpose, presence: true
  validates :image, presence: true
  
  validates :category_id, numericality: { other_than: 1 } 

end
