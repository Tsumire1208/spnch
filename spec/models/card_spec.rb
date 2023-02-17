require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe 'カード作成' do
    context 'カードが作成できる場合' do
      it 'titleとmemoが存在していれば保存できる' do
        expect(@card).to be_valid
      end

      it 'memoが空でも保存できる' do
        @card.memo = nil
        expect(@card).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'titleが空では保存できない' do
        @card.title = ''
        @card.valid?
        expect(@card.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'titleが256文字以上では保存できない' do
        @card.title = 'a' * 256
        @card.valid?
        expect(@card.errors.full_messages).to include("タイトルは1文字以上、255文字以内でご入力ください")
      end

      it 'memoが1001文字以上では保存できない' do
        @card.memo = 'a' * 1001
        @card.valid?
        expect(@card.errors.full_messages).to include("メモ内容は1000文字以内で入力してください")
      end

      it 'listが紐付いていないと保存できない' do
        @card.list = nil
        @card.valid?
        expect(@card.errors.full_messages).to include('リスト情報を入力してください')
      end
    end
  end
end
