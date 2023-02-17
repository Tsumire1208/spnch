require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:room)
  end

  describe 'Todoリスト作成' do
    context '新規作成できる場合' do
      it "titleの値が存在すれば作成できる" do
        expect(@list).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "titleを入力してください" do
        @list.name = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("タイトルを入力してください")
      end
    end
  end
end
