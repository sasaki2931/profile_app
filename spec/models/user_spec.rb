require 'rails_helper'
RSpec.describe User, type: :model do
    describe 'バリデーションのテスト' do
        context '名前のが空の場合' do
          it 'バリデーションにひっかる' do
            user = User.new(name: '', email: 'aa@aa.com',password: 'password',introduce: 'あ'*50,image: '')
            expect(user).not_to be_valid
          end
        end
        context 'メールアドレスが空の場合' do
          it 'バリデーションにひっかかる' do
            user = User.new(name: '太郎', email: '',password: 'password',introduce: 'あ'*50,image: '')
            expect(user).not_to be_valid
          end
        end
        context 'パスワードが空の場合' do
          it 'バリデーションに引っかかる' do
            user = User.new(name: '太郎', email: '',password: 'password',introduce: 'あ'*50,image: '')
            expect(user).not_to be_valid
          end
        end
      context '自己紹介が空の場合' do
        it 'バリデーションが通らない' do
          user = User.new(name: '太郎', email: 'aa@aa.com',password: 'password',introduce: '',image: '')
          expect(user).not_to be_valid
        end
      end
      context '全ての条件が達成されているとき' do
        it 'バリデーションが通る' do
          user = User.new(name: '太郎', email: 'aa@aa.com',password: 'password',introduce: 'あ'*50,image: '')
          expect(user).to be_valid
        end
      end
    end
end