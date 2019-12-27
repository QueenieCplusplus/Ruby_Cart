// try ruby
//2019,12/27, by Queenie Chen

// 購物車內容不會建立資料表，只是將 Hash 存在 session 裡。
// session 內的內容，能被還原成 Hash。

// Features, 基本功能：
// 1.商品丟入購物車，購物車內因而有商品。
// 2.被丟入的商品品項如果相同，則數目增加。
// 3.被丟入的商品能被取出。
// 4.有數量後，能計算總金額。
// 5.可以搭配促銷活動折扣。

//內容：
// Cart
// CartItem
// Product = ItemName
// Price
// Quantity

//file: app/models/cart.rb 
// class Cart
// end

//先測試才寫程式
// 免繼承類別
// 下指令 $rspec 跑測試

//Spec, 規格表
// require 'rail_helper'
// RSpec.describe Cart, type: :model do
//   describe "購物車基本功能" do
//    it ""
//    it ""
//   end

//   describe "購物車進階功能" do
//    it ""
//   end
// end

// Test1
require 'rails_helper'

RSpec.describe Cart, type::model do
    describe "購物車功能" do

        it "features(1)" do

            cart = Cart.new #新增一台購物車
            cart.add_item 1 #丟入一品項至購物車內 ＃先假設用1代替傳入參數
            expect(cart.empty?).to be false 
    end
end

// Code1
class Cart
    def initialize
        @items = [] #在init方法中初始化一空陣列
    end

    def add_item(product_id) #傳入參數的方法
        @items << product_id
    end

    def empty?
        @items.empty? #此方法能回傳確定購物車是否為空的布林值
    end
end



