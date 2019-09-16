class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    product_price = Product.find(params[:product_id]).price
    quantity = params[:quantity].to_i

    subtotal = product_price * quantity
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
                      user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity],
                      subtotal: subtotal,
                      tax: tax,
                      total: total
                      )
    if @order.save
      render 'show.json.jb'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    render 'show.json.jb'
  end  
end
