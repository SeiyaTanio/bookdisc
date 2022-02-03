require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    user = FactoryBot.create(:user)
    tweet = FactoryBot.create(:tweet)
    @like = FactoryBot.build(:like, user_id: user.id, tweet_id: tweet.id)
  end

  describe 'ツイートのいいね機能' do
    context 'いいねできる場合' do
      it '全ての情報が正しく存在すれば投稿できる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねできない場合' do
      it 'ユーザーidが空では送信できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('User must exist')
      end
      it 'ツイートidが空では送信できない' do
        @like.tweet = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('Tweet must exist')
      end
    end
  end
end
