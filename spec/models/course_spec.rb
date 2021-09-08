require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = FactoryBot.build(:course)
  end
  describe 'コース新規登録' do
    context 'コース登録できるとき'do
      it 'コースの特徴、user_id、score_idが存在すれば登録できること' do
        expect(@course).to be_valid
      end
      
      it 'コースの特徴欄がnullでも登録できること' do
        @course.feature = ''
        expect(@course).to be_valid
      end  
    end
    
    context 'コース登録できないとき' do  
      it 'ユーザーが紐付いていないと登録できない' do
        @course.user = nil
        @course.valid?
        expect(@course.errors.full_messages).to include('Userを入力してください')
      end

      it 'アクティビティが紐付いていないと登録できない' do
        @course.score = nil
        @course.valid?
        expect(@course.errors.full_messages).to include('Scoreを入力してください')
      end
    end
  end
end
