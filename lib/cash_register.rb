class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_item_quantity, :last_item_price
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        total = quantity * price
        self.total += total
        count = 0
        until count == quantity do
            self.items << title
            count += 1
        end
        self.last_item_price = price
        self.last_item_quantity = quantity
    end

    def apply_discount
        if (self.discount == 0)
            "There is no discount to apply."
        else
            self.total = self.total - ((self.total * discount) / 100)
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        count = 0
        until count == self.last_item_quantity do
            self.items.pop
            self.total -= last_item_price
            count += 1
        end
    end
end
