require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート新規投稿' do
    context 'ツイートできる場合' do
      it '全ての情報が正しく存在すれば登録できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートできない場合' do
      it 'ツイート内容が空では登録できない' do
        @tweet.content = ' '
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Content can't be blank")
      end
      it 'ユーザーidが空では登録できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
