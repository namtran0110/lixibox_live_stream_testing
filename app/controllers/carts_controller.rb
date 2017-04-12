class CartsController < ApplicationController

  def index
    @order_items = current_order.order_items
    @order = current_order
  end

  def payment
    @order = current_order
    @order.update_attributes order_status_id: 2

    if !session[:order_id].nil?
      session.delete(:order_id)
    end
    flash[:success] = "Your order was successful!"
    redirect_to root_path
  end

end
