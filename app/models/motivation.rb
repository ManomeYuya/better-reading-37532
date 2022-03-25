class Motivation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :caregory
  alidates :category_id, numericality: { other_than: 1 }

  has_many :notifications
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :purchase_date, presence: true
  validates :purpose, presence: true

end
