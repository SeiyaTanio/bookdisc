require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room, user_ids: [@user.id, @another_user.id])
  end

  describe 'ルーム新規作成' do
    context '作成できる場合' do
      it '全ての情報が正しく存在すれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'ルーム名が空では登録できない' do
        @room.room_name = ' '
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name can't be blank")
      end
      it 'user_idsの数が1つ以下では登録できない' do
        @room.user_ids = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("User ids is too short (minimum is 2 characters)")
      end
      it 'ルーム名が31文字以上だと登録できない' do
        @room.room_name = Faker::Lorem.characters(number: 31)
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name is too long (maximum is 30 characters)")
      end
    end
  end
end
