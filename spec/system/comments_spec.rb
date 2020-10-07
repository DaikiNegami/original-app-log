require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary = FactoryBot.create(:diary)
    @comment = Faker::Lorem.sentence
  end
  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # トップページに移動する
    visit root_path
    # トップページにログインページへ遷移するボタンがある
    expect(page).to have_content('ろぐいん')
    # ログインページへ遷移する
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    # ログインボタンを押す
    find('input[name="commit"]').click
    # トップページへ遷移する
    expect(current_path).to eq root_path
    # ツイート詳細ページに遷移する
    visit diary_path(@diary)
    # フォームに情報を入力する
    fill_in 'comment_comment', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がる
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされる
    expect(current_path).to eq diary_path(@diary)
    # 詳細ページ上に先ほどのコメント内容が含まれている
    expect(page).to have_content @comment
  end
end
