require 'pry'

class CashRegister

  attr_accessor :total, :discount, :item   
  

  ITEM  = []
  PREVIOUS_PRICE = []
  PREVIOUS_TOTAL = []
  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end 
  
 
  
  def add_item(title, price, quantity = 1)
     
    quantity.times {
    
    PREVIOUS_TOTAL << @total
    PREVIOUS_PRICE << price 
    ITEM << title
      
    }

    
    if quantity > 1
      @total += (price * quantity) 
    else 
      @total += price 
    end 
  end 
  
  
  
  def apply_discount
    if @discount > 0 
      @total = @total - (@discount * 10)
       discount_var = @total
    
       message =  "After the discount, the total comes to $#{discount_var}."
       
    else 
      message = "There is no discount to apply."
    end 
     message
  end 
  
def items
   ITEM
  end
  
  def void_last_transaction 
    
    last_transaction_price = PREVIOUS_PRICE.last 
    PREVIOUS_PRICE.pop
    ITEM.pop 
    @total = @total - last_transaction_price
    if ITEM.last == nil
      @total = 0.0 
    end 
   
  end 
  
end
