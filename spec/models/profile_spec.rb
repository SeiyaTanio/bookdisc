require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール登録' do
    context 'プロフィール登録できる場合' do
      it '全ての情報が正しく存在すれば登録できる' do
        expect(@profile).to be_valid
      end
    end
    context 'コメント投稿できない場合' do
      it 'ユーザーidが空では送信できない' do
        @profile.user = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include('User must exist')
      end
      it 'お気に入りの本が151文字以上だと登録できない' do
        @profile.favorite_book = Faker::Lorem.characters(number: 151)
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Favorite book is too long (maximum is 150 characters)")
      end
      it '自己紹介が151文字以上だと登録できない' do
        @profile.self_introduction = Faker::Lorem.characters(number: 151)
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Self introduction is too long (maximum is 150 characters)")
      end
    end
  end
end
