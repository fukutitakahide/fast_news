require 'rails_helper'

RSpec.describe User, type: :model do
     it "名前、パスワード、チェックがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
      end

  it "名がない場合、無効である" do
    user = FactoryBot.build(:user,name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "重複した名前の場合、無効である" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:name]).to include("has already been taken")
  end
  
  it "チェックがない場合、無効である" do
    user = FactoryBot.build(:user, like_life_id: nil,like_it_id: nil,like_area_id: nil,
    like_science_id: nil,like_sports_id: nil,like_entertainment_id: nil,like_economy_id: nil,)
    user.valid?
    expect(user.errors[:like_life_id,:like_it_id,:like_area_id,:like_science_id,
    :like_sports_id,:like_entertainment_id,:like_economy_id,]).to include("can't be blank")
  end
  
  
  
  
end
    
    
    
#   it "名前、パスワード、チェックがある場合、有効である" do
# 　　 # userのそれぞれのカラムに対して値を入れてオブジェクト化する
#     user = User.new(
#     name: "tarou",
#     password: "test",
#     # like_life_id: "1",
#     # like_it_id: "1",
#     # like_area_id: "1",
#     # like_science_id: "1",
#     # like_sports_id: "1",
#     # like_entertainment_id: "1",
#     # like_economy_id: "1",
#      )
#      # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
#      expect(user).to be_valid
#   end

#   it "名がない場合、無効である" do
#   　　 # first_nameでnilを設定する
#     user = User.new(
#     name: nil,
#     password: "pass",
    
    
    
    
#      )
#      # valid?メソッドを呼び出すとエラー検証が行えます。次行のerrorsメソッドを使うために必要です。
# 　　　user.valid?　
#      # valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれます。今回は特に[:first_name]のエラーがみたいのでexpect()内部で指定してあげます。
# 　　　# 今回は"can't be blank"というエラーを含んでいる(include)しているはずという記述になります。複数含む場合ももちろんあります。
#      expect(user.errors[:first_name]).to include("can't be blank")
#   end
#   it "姓がない場合、無効である" 
#   it "メールアドレスがない場合、無効である" 
#   it "重複したメールアドレスの場合、無効である"
# 　it "パスワードがない場合、無効である"
#  end
# end