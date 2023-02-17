require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        expect(@chat).to be_valid
      end
      it 'contentが空でも保存できる' do
        @chat.content = ''
        expect(@chat).to be_valid
      end
      it 'imageが空でも保存できる' do
        @chat.image = nil
        expect(@chat).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @chat.content = ''
        @chat.image = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include("メッセージを入力してください")
      end
      it 'roomが紐付いていないと保存できない' do
        @chat.room = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('ルーム情報を入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @chat.user = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('ユーザー情報を入力してください')
      end
    end
  end
end
