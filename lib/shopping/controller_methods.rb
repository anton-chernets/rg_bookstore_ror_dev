module Shopping
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      if Shopping.set_order_on_each_request
        before_action :set_current_order
      end
    end

    def current_order
      @current_order
    end

    def set_current_order
      begin
        @current_order = Shopping::Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        create_current_order
      end
    end

    def create_current_order
      @current_order = Shopping::Order.create
      session[:order_id] = @current_order.id
    end
  end
end