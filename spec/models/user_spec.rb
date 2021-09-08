require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき'do
    it 'ニックネーム、メールアドレス、パスワード、パスワード（確認）、生年月日、性別、主なランエリアが存在すれば登録できること' do
      expect(@user).to be_valid
    end      
    
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'a1b2c3'
      @user.password_confirmation = 'a1b2c3'
      expect(@user).to be_valid
    end
    
    it '年齢を公開しない場合はチェック欄がtrueでも登録できること' do
      @user.p_birthday = true
      expect(@user).to be_valid
    end
    
    it '性別を公開しない場合はチェック欄がtrueでも登録できること' do
      @user.p_sex = true
      expect(@user).to be_valid
    end
    
    it 'エリアを公開しない場合はチェック欄がtrueでも登録できること' do
      @user.p_area = true
      expect(@user).to be_valid
    end
    
    it '自己紹介欄に入力がなくても登録できること' do
      @user.profile = ''
      expect(@user).to be_valid
    end
  end
    
    context 'ユーザー登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
  
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
  
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      
      it 'パスワードは、半角英字だけでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      
      it 'パスワードは、半角数字だけでは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      
      it 'パスワードは、全角では登録できないこと' do
        @user.password = 'ａ１ｂ２ｃ３'
        @user.password_confirmation = 'ａ１ｂ２ｃ３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'a1b2c3'
        @user.password_confirmation = 'a1b2c3d'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      
      it '性別が必須であること' do
        @user.sex_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性別can't be blank")
      end
      
      it '主なランエリアが必須であること' do
        @user.area_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("主なランエリアcan't be blank")
      end
    end
  end
end
