module SignInSupport
  def sign_in(user)
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
  end
end