module Shopping
  class ShoppingCartController < ShoppingController
    def show
      @order = current_order
    end

    def complete
      not_found unless flash[:order_id]

      @order = Order.find(flash[:order_id])
    end
  end
end
