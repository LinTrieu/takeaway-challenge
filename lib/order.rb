# Allows user to create an order, add to their basket, display their basket and display a total price" 
require_relative 'menu'

class Order
  attr_reader :basket_summary , :total

  def initialize
    @basket_summary = Hash.new(0)
    @total = 0
  end

  def add(dish, quantity = 1)
    @basket_summary[dish] += quantity
  end

  def price_calc
    menu = Menu.new
    @basket_summary.each do |food,quantity|
      qty = @basket_summary[food]
      price = menu.price(food)
      cost = price * qty
      @total += cost
    end
  end

  def display_total
    order = Order.new
    order.price_calc
    "Your order total is currently £#{@total}"
  end

end

# o = Order.new
# o.add("pizza",3)
# o.add("pasta",2)
# o.add("bread",1)
# puts o.basket_summary
# o.price_calc
# o.display_total