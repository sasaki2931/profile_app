require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  let(:user) {FactoryBot.create(:user)}

  describe "ログイン機能" do
    context "ユーザーがログインする場合" do
      it "ログインができる" do
        user
        visit new_session_path
        fill_in 'session_email', with: 'example@railstutorial.org'
        fill_in 'session_password', with: 'foobar'
        click_on 'Log in'
        expect(page).to have_content "自己紹介"
      end
    end
    context "ユーザーがログアウトする場合" do
      it "ログアウトができる" do
        user
        visit new_session_path
        fill_in 'session_email', with: 'example@railstutorial.org'
        fill_in 'session_password', with: 'foobar'
        click_on 'Log in'
        click_on 'ログアウト'
        expect(page).to have_content "ログイン"
      end
    end
  end

  describe '自己紹介編集機能' do
    it '自己紹介を編集できる' do
      user
      visit new_session_path
      fill_in 'session_email', with: 'example@railstutorial.org'
      fill_in 'session_password', with: 'foobar'
      click_on 'Log in'
      click_on '自己紹介を編集する'
      click_on '自己紹介を確定する'
      expect(page).to have_content "自己紹介"
    end
  end

end