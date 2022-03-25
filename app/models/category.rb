class Category < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ビジネス' },
    { id: 3, name: '政治' },
    { id: 4, name: '一般教養' },
    { id: 5, name: '語学' },
    { id: 6, name: '趣味実用' },
    { id: 7, name: '自己啓発' },
    { id: 8, name: '絵本・こども向け' },
    { id: 9, name: 'その他' },
  ]

  #include ActiveHash::Associations
  #has_many :motivations
end
