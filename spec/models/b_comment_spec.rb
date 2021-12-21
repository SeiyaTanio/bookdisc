require 'rails_helper'

RSpec.describe BComment, type: :model do
  before do
    user = FactoryBot.create(:user)
    blog = FactoryBot.create(:blog)
    @b_comment = FactoryBot.build(:b_comment, user_id: user.id, blog_id: blog.id)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it '全ての情報が正しく存在すれば投稿できる' do
        expect(@b_comment).to be_valid
      end
    end
    context 'コメント投稿できない場合' do
      it '内容が空では登録できない' do
        @b_comment.b_text = ' '
        @b_comment.valid?
        expect(@b_comment.errors.full_messages).to include("B text can't be blank")
      end
      it 'ユーザーidが空では送信できない' do
        @b_comment.user = nil
        @b_comment.valid?
        expect(@b_comment.errors.full_messages).to include('User must exist')
      end
      it 'ブログidが空では送信できない' do
        @b_comment.blog = nil
        @b_comment.valid?
        expect(@b_comment.errors.full_messages).to include('Blog must exist')
      end
      it '内容が151文字以上だと登録できない' do
        @b_comment.b_text = Faker::Lorem.characters(number: 151)
        @b_comment.valid?
        expect(@b_comment.errors.full_messages).to include("B text is too long (maximum is 150 characters)")
      end
    end
  end
end
