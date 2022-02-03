require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user = FactoryBot.create(:user)
    follower = FactoryBot.create(:user)
    @relationship = FactoryBot.build(:relationship, user_id: user.id, follower_id: follower.id)
  end

  describe 'フォロー機能' do
    context 'フォローできる場合' do
      it '全ての情報が正しく存在すればフォローできる' do
        expect(@relationship).to be_valid
      end
    end
    context 'フォローできない場合' do
      it 'ユーザーidが空では送信できない' do
        @relationship.user = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('User must exist')
      end
      it 'フォロワーidが空では送信できない' do
        @relationship.follower = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Follower must exist')
      end
    end
  end
end
