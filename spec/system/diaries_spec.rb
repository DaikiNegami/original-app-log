require 'rails_helper'

RSpec.describe '日記投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary_title = Faker::Lorem.sentence
    @diary_text = Faker::Lorem.sentence
  end
  context '日記が投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがある
      expect(page).to have_content('にっきをかく')
      # 投稿ページに移動する
      visit new_diary_path
      # フォームに情報を入力する
      fill_in 'diary-name', with: @diary_title
      fill_in 'diary-text', with: @diary_text
      # 送信するとDiaryモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Diary.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容のツイートが存在する（テキスト）
      expect(page).to have_content(@diary_title)
      # トップページには先ほど日記を投稿したユーザーのニックネームが存在する
      expect(page).to have_content(@user.nickname)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
    end
  end
end

RSpec.describe '日記の詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary = FactoryBot.create(:diary)
  end
  it 'ログインしたユーザーはツイート詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@user)
    # 詳細ページに遷移する
    visit diary_path(@diary)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_content("#{@diary.title}")
    expect(page).to have_content("#{@diary.text}")
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態でツイート詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # 詳細ページに遷移する
    visit diary_path(@diary)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_content("#{@diary.title}")
    expect(page).to have_content("#{@diary.text}")
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector 'form'
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content 'こめんとするには、しんきとうろく/ろぐいんがひつようです。'
  end
end

RSpec.describe 'マイページ', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'マイページが存在するとき'do
    it 'ログインしたユーザーのマイページボタンが表示' do
      # ログインする
      sign_in(@user)
      # マイページへのリンクがある
      expect(page).to have_content(@user.nickname)
      # マイページに移動する
      visit user_path(@user.id)
    end
  end
  context 'マイページが存在しないとき'do
    it 'ログインしていないとマイページボタンが表示されない' do
      # トップページに移動する
      visit root_path
      # マイページボタンが存在しないことを確認する
      expect(page).to have_no_selector '.nav-lists1'
    end
  end
end
