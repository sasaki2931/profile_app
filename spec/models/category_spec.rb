require 'rails_helper'
RSpec.describe Category, type: :model do
    describe 'バリデーションのテスト' do
        context '名前のが空の場合' do
          it 'バリデーションにひっかる' do
            category = Category.new(name: '')
            expect(category).not_to be_valid
          end
        end
    end
end