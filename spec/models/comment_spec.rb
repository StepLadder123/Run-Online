require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント新規投稿' do
    context 'コメント投稿できるとき'do
      it 'テキスト、user_id、score_idが存在すれば登録できること' do
        expect(@comment).to be_valid
      end      
    end
    
    context 'コメント投稿できないとき' do  
      it 'テキストが必須であること' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
      
      it 'ユーザーが紐付いていないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end

      it 'アクティビティが紐付いていないと登録できない' do
        @comment.score = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Scoreを入力してください')
      end
    end
  end
end
