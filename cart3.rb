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

//Spec3, 規格表2
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

// Test3
require 'rails_helper'

RSpec.describe Cart, type::model do
    describe "購物車功能" do

        it "features(3)" do

            cart = Cart.new #新增一台購物車

            pK = Product.create(title:"iOS") #建立商品品項及其名稱
            pQ = Product.create(title:"Android")

            # n.times { cart.add_item(p)}  #若加入重複品項如p，則數量+1，此處n是數字代表重複次數
            2.times { cart.add_item(pK) }
            3.time {cart.add_item(pQ) }

            #expect(cart.items.length).to be 18+n #購物車品項數量
            #expect(cart.items.first.Quantity).to be n #購物車第一品項數量有n個

            expect(cart.items.first.product_id).to be pK.id #購物車第一個商品品項的id=商品pK的id
            expect(cart.items.second.product_id).to be pQ.id 
            expect(cart.items.first.Product).to be_a Product #第一品項取出是一商品
    end
end

// structure3 建立資料模組稱為 Product商品 並且放入購物車內
// $bin/rails g model Product title description:text price:integer
// create db/migration/201720191227_create_products.rb
// create app/models/product.rb
// invoke rspec
// create    spec/models/product_spec.rb
// invoke       factory_girl
//                 spec/factories/products.rb
// 然後執行 bin/rails db:migrate

// Code3
class Cart

    attr_reader :items #在items變數基礎上加入屬性 #其為存取子，方便內外部取用。

    def initialize
        @items = [] #在init方法中初始化一空陣列
    end

    def add_item(product_id) #傳入參數的方法
        #@items << product_id

        # find 是 ruby 內建函數 for 陣列用
        found_item = items.find { |item| item.product_id == product_id }

        if found_item
            found_item.increment #找到則同品項數量追加
        else
            @items << CartItem.new(product_id) #找不到，則將新品項用購物車品項包住後丟入陣列變數
        end    
    end

    def empty?
        @items.empty? #此方法能回傳確定購物車是否為空的布林值
    end
end


// 請詳 class CartItem 在 cart_item2.rb

