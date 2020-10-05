require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日記の投稿' do
    context "日記が投稿できる場合" do
      it "title、textが存在すれば登録できること" do
        expect(@diary).to be_valid
      end
    end

    context "日記が投稿できない場合" do
      it "titleが空では登録できないこと" do
        @diary.title = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("だいめいをにゅうりょくしてね")
      end
      it "textが空では登録できないこと" do
        @diary.text = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("ぶんしょうをにゅうりょくしてね")
      end
    end

  end
end