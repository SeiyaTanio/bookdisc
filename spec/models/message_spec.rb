require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
    room = FactoryBot.create(:room, user_ids: [user.id, another_user.id])
    @message = FactoryBot.build(:message, user_id: user.id, room_id: room.id)
  end

  describe 'メッセージ送信' do
    context 'メッセージ送信できる場合' do
      it '全ての情報が正しく存在すれば登録できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージ送信できない場合' do
      it '内容が空では登録できない' do
        @message.sentence = ' '
        @message.valid?
        expect(@message.errors.full_messages).to include("Sentence can't be blank")
      end
      it 'ユーザーidが空では送信できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
      it 'ルームidが空では送信できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end
      it '内容が151文字以上だと登録できない' do
        @message.sentence = Faker::Lorem.characters(number: 151)
        @message.valid?
        expect(@message.errors.full_messages).to include("Sentence is too long (maximum is 150 characters)")
      end
    end
  end
end
