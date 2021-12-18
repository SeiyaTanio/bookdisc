require 'rails_helper'

RSpec.describe Blog, type: :model do
  before do
    @blog = FactoryBot.build(:blog)
  end

  describe 'ブログ新規投稿' do
    context '投稿できる場合' do
      it '全ての情報が正しく存在すれば登録できる' do
        expect(@blog).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'タイトルが空では登録できない' do
        @blog.title = ' '
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Title can't be blank")
      end
      it '記事が空では登録できない' do
        @blog.article = ' '
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Article can't be blank")
      end
      it 'ユーザーidが空では登録できない' do
        @blog.user = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include('User must exist')
      end
      it 'タイトルが51文字以上だと登録できない' do
        @blog.title = Faker::Lorem.characters(number: 51)
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Title is too long (maximum is 50 characters)")
      end
    end
  end
end
