class Card < ApplicationRecord
  belongs_to :list

  validates :title, presence: true, length: { in: 1..255, message: "は1文字以上、255文字まででご入力ください" }
  validates :memo, length: { in: 1..1000 }
end
