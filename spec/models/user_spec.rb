require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let!(:user) { build(:user) }
    
    context '必要なパラメーターが登録されている場合' do
      it '有効であること' do
        expect(user).to be_valid
      end
    end

    context 'emailが存在しない場合' do
      it '無効であること' do
        user.email = nil
        expect(user).to be_invalid
      end
    end
    context 'emailがユニークでない場合' do
      let!(:user) { create(:user) }
      let!(:user_duplicate_email) { build(:user, email: user.email) }
      it '無効であること' do
        expect(user_duplicate_email).to be_invalid
      end
    end
    # TODO: 論理削除されている場合はユニークでなくても有効であることのテストを追加

    context 'emailが不正な形式の場合' do
      it '無効であること' do
        user.email = 'invalid_email'
        expect(user).to be_invalid
      end
    end

    context 'passwordが存在しない場合' do
      it '無効であること' do
        user.password = nil
        expect(user).to be_invalid
      end
    end

    context 'passwordが5文字の場合' do
      it '無効であること' do
        user.password = 'short'
        expect(user).to be_invalid
      end
    end

    context 'passwordが6文字の場合' do
      it '有効であること' do
        user = build(:user, password: '123456', password_confirmation: '123456')
        expect(user).to be_valid
      end
    end
  end
end
