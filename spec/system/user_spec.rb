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
  end
end