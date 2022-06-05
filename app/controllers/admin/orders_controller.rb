# frozen_string_literal: true

module Admin
  class OrdersController < AdminController
    def index
      @orders = Order.all.includes([:employee]).order(:status)
    end

    def update
      @order = Order.find(params[:id])
      @order.status_delivered!
      redirect_to admin_orders_path, notice: 'Order delivered successfully.'
    end
  end
end
