require "pry"

class CashRegister
    attr_reader :discount
    attr_accessor :total, :last_transaction
    def initialize(discount = 0, total = 0)
        @discount = discount
        @total = total
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        last_transaction << price * quantity
        self.total += price * quantity
        quantity.times {|i| self.items << title}
    end

    def apply_discount
        if self.discount > 0 
            self.total = self.total - self.total * self.discount / 100
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if self.last_transaction.length == 0
            return 0.0
        else
            self.total -= self.last_transaction.last
            self.last_transaction.pop
            return self.total
        end
    end
end

# binding.pry
