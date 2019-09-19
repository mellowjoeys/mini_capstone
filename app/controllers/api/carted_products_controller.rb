class Api::CartedProductsController < ApplicationController

  def index
    added_products = CartedProduct.where(user_id: current_user.id)
    @carted_products = []
    added_products.each do |added_product|
      if added_product.status == "carted"
        @carted_products << added_product
      end
    end
    render 'index.json.jb'

  end

  def create
    @carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id, status: "carted")
# do we need order_id?
    if @carted_product.save
      render json: {message: "#{@carted_product} added to cart successfully"}
    else 
      render json: {message: "Invalid attempt at adding to cart"}
    end
  end

end
