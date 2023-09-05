require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'バリデーションのテスト' do
    context '名前のが空の場合' do
    it 'バリデーションにひっかること' do
      # 名前を空にした Skill オブジェクトを手動で作成
      skill = Skill.new(
        name: '',
        level: 5,
        user_id: 1,
        category_id: 1
      )

      expect(skill).not_to be_valid
    end
   end
   context '名前のが空の場合' do
    it 'バリデーションにひっかかること' do
      # レベルを nil にした Skill オブジェクトを手動で作成
      skill = Skill.new(
        name: 'スキル名',
        level: '',
        user_id: 1,
        category_id: 1
      )

      expect(skill).not_to be_valid
    end
  end
  end
end