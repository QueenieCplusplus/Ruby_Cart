# Ruby_Cart
用 Ruby 寫購物車邏輯的類別

plz see code.

Features, 基本功能：

1.商品丟入購物車，購物車內因而有商品。

  https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart1.rb

2.被丟入的商品品項如果相同，則數目增加。

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart2.rb

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart_item.rb%20

3.被丟入的商品能被取出。

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart3.rb

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart_item2.rb

4.有數量後，能計算小計金額。 

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart4.rb

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart_item3.rb

5. 算出整台購物車總計金額。

// 可以搭配促銷活動折扣。

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart5.rb

6. Cart 轉成 Hash 雜湊格式->存到 session 中。

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart6.rb

        private
        def session_hash
            {
                "items" => [
                    {"product_id" => pK, "quantity" => 2},
                    {"produce_id" => pQ, "quantity" => 3}
                ]
            }
        end

>>>

      def serailize

          all_items = items.map { |item|

             "product_id" => item.product_id,
             "quantity" => item.quantity

          }

          {"items" => all_items}

      end
      
7. Hash 轉成 Cart 格式。

https://github.com/QueenieCplusplus/Ruby_Cart/blob/master/cart7.rb

        def self.from_hash_to_cart(hash)

            if hash.nil?
                new[]
            else
                new hash[items].map {|item_hash|

                    CartItem.new(item_hash["product_id"], item_hash["Quantity"])

                }  
            end
        end   


