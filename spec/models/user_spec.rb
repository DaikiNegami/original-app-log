require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("にっくねーむをにゅうりょくしてね")
      end
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("めーるあどれすをにゅうりょくしてね")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("めーるあどれすはすでに存在します")
      end
      it "@を含まないメールアドレスは登録できない" do
        @user.email = "email.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("めーるあどれすをただしくにゅうりょくしてね")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ぱすわーど（かくにん）をただしくにゅうりょくしてね")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("ぱすわーどは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("ぱすわーど（かくにん）をただしくにゅうりょくしてね")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ぱすわーど（かくにん）をただしくにゅうりょくしてね")
      end
    end
  end
end
