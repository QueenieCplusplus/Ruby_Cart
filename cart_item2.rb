// try ruby
// 2019, 12/27, by Queenie Chen

// Code2-2
// 在 app/models 目錄下
// 新增 CartItem 類別
// 檔案名稱為 cart_item.rb 
// 請詳 cart_item.rb code

Class CartItem

    attr_reader :product_id, :Quantity

    def initialize(product_id, Quantity = 1) #第二個參數的意思是說，倘若輸入沒有傳入，則預設為1
        @product_id = product_id
        @Quantity = Quantity
    end

    def increment(n = 1) #每次呼叫此方法，預設傳入+1次數
        @Quantity +=n
    end

    def Product.find_by(id: product_id) #方便從購物車取出品項的辨識方法

end