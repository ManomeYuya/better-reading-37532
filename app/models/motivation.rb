class Motivation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  has_many :notifications
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :title, presence: true
  validates :purchase_date, presence: true
  validates :purpose, presence: true

end
