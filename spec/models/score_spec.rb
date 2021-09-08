require 'rails_helper'

RSpec.describe Score, type: :model do
  before do
    @score = FactoryBot.build(:score)
  end
  describe 'アクティビティ新規登録' do
    context 'アクティビティ登録できるとき'do
      it 'ルート画像、日付、距離、タイム（時間、分、秒）、ランエリア、user_idが存在すれば登録できること' do
        score_calc
        expect(@score).to be_valid
      end      
      
      it '時間欄がnullでも登録できること' do
        @score.hour = ''
        score_calc
        expect(@score).to be_valid
      end
      
      it '時間欄が0でも登録できること' do
        @score.hour = 0
        score_calc
        expect(@score).to be_valid
      end
      
      it '分欄がnullでも登録できること' do
        @score.minute = ''
        score_calc
        expect(@score).to be_valid
      end
      
      it '分欄が0でも登録できること' do
        @score.minute = 0
        score_calc
        expect(@score).to be_valid
      end
      
      it '秒欄がnullでも登録できること' do
        @score.second = ''
        score_calc
        expect(@score).to be_valid
      end
      
      it '秒欄が0でも登録できること' do
        @score.second = 0
        score_calc
        expect(@score).to be_valid
      end
      
      it 'アクティビティを公開しない場合はチェック欄がtrueでも登録できること' do
        @score.private = true
        score_calc
        expect(@score).to be_valid
      end
    end
    
    context 'アクティビティ登録できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @score.image = nil
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("ルート画像を入力してください")
      end
      
      it '日付が必須であること' do
        @score.date = ''
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("ランニング日付を入力してください")
      end
      
      it '距離が必須であること' do
        @score.distance = ''
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("距離は0より大きい値にしてください")
      end
      
      it '距離が0.01以上であること' do
        @score.distance = 0
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("距離は0より大きい値にしてください")
      end
      
      it 'タイム（時間、分、秒）のいずれかは必須であること' do
        @score.hour = ''
        @score.minute = ''
        @score.second = ''
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("タイムは0より大きい値にしてください")
      end
      
      it 'タイム（時間、分、秒）のいずれかは1以上であること' do
        @score.hour = 0
        @score.minute = 0
        @score.second = 0
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("タイムは0より大きい値にしてください")
      end
      
      it '時間が24未満であること' do
        @score.hour = 24
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("時間は24より小さい値にしてください")
      end
      
      it '分が60未満であること' do
        @score.minute = 60
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("分は60より小さい値にしてください")
      end
      
      it '秒が60未満であること' do
        @score.second = 60
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("秒は60より小さい値にしてください")
      end
      
      it 'ランエリアが必須であること' do
        @score.area_id = ''
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include("ランエリアcan't be blank")
      end
      
      it 'ユーザーが紐付いていないと登録できない' do
        @score.user = nil
        score_calc
        @score.valid?
        expect(@score.errors.full_messages).to include('Userを入力してください')
      end
    end
  end

  private
  
  def score_calc
    if @score.hour == nil
      @score.hour = 0
    end
    if @score.minute == nil
      @score.minute = 0
    end
    if @score.second == nil
      @score.second = 0
    end
    if @score.distance == nil
      @score.distance = 0
    end
    @score[:time] = (@score.hour * 60 + @score.minute) * 60 +@score.second
    @score[:lap] = @score.time / @score.distance
  end
end
