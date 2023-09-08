require 'rails_helper'

RSpec.describe 'スキルページ', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category ) }
  let!(:skill) { FactoryBot.create(:skill, user: user,category: category) }

  before do
    user
    skill

    visit new_session_path
    fill_in 'session_email', with: 'example@railstutorial.org'
    fill_in 'session_password', with: 'foobar'
    click_on 'Log in'
  end

  describe 'スキル追加機能' do
    it 'スキルを追加できる' do
      visit new_skill_path(category_id: category.id)
      fill_in 'skill_name', with: "テスト"
      select '4', from: 'skill_level'
      click_on '追加する'
      expect(page).to have_content "追加しました"
    end
  end


 end

