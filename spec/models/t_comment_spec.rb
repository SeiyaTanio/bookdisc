require 'rails_helper'

RSpec.describe TComment, type: :model do
  before do
    user = FactoryBot.create(:user)
    tweet = FactoryBot.create(:tweet)
    @t_comment = FactoryBot.build(:t_comment, user_id: user.id, tweet_id: tweet.id)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it '全ての情報が正しく存在すれば投稿できる' do
        expect(@t_comment).to be_valid
      end
    end
    context 'コメント投稿できない場合' do
      it '内容が空では登録できない' do
        @t_comment.t_text = ' '
        @t_comment.valid?
        expect(@t_comment.errors.full_messages).to include("T text can't be blank")
      end
      it 'ユーザーidが空では送信できない' do
        @t_comment.user = nil
        @t_comment.valid?
        expect(@t_comment.errors.full_messages).to include('User must exist')
      end
      it 'ツイートidが空では送信できない' do
        @t_comment.tweet = nil
        @t_comment.valid?
        expect(@t_comment.errors.full_messages).to include('Tweet must exist')
      end
      it '内容が151文字以上だと登録できない' do
        @t_comment.t_text = Faker::Lorem.characters(number: 151)
        @t_comment.valid?
        expect(@t_comment.errors.full_messages).to include("T text is too long (maximum is 150 characters)")
      end
    end
  end
end
