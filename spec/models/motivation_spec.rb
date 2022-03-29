require 'rails_helper'

RSpec.describe Motivation, type: :model do
  before do
    user = FactoryBot.create(:user)
    @motivation = FactoryBot.build(:motivation, user_id: user.id) #buildはuser newと同じでインスタンスを作るためのもの
  end

  describe '動機投稿機能' do
    context '内容に問題ある場合' do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@motivation).to be_valid
      end
      it 'personは空でも保存できる' do
        @motivation.person = ''
        expect(@motivation).to be_valid
      end
      it 'commentは空でも保存できる' do
        @motivation.comment = ''
        expect(@motivation).to be_valid
      end
      it 'intuitionは空でも保存できる' do
        @motivation.intuition = ''
        expect(@motivation).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "titleが空では登録できない" do
        @motivation.title = ''
        @motivation.valid?
        expect(@motivation.errors.full_messages).to include("Title can't be blank")
      end
      it "imageが空では登録できない" do
        @motivation.image = nil
        @motivation.valid?
        expect(@motivation.errors.full_messages).to include("Image can't be blank")
      end
      it "purposeが空では登録できない" do
        @motivation.purpose = ''
        @motivation.valid?
        expect(@motivation.errors.full_messages).to include("Purpose can't be blank")
      end
      it 'category_id:初期値を選んだ場合は保存できない' do
        @motivation.category_id = 1
        @motivation.valid?
        expect(@motivation.errors.full_messages).to include("Category must be other than 1")
      end
    end 
end
end
