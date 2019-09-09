class Api::ProductsController < ApplicationController
  def index 
    @products = Product.all
    render 'index.json.jb'
  end

  def create
    @product = Product.new(
                name: params[:name],
                price: params[:price],
                image_url: params[:image_url],
                description: params[:description]
               )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render 'show.json.jb'
    else 
      render json: {errors: @product.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {store_owner: 'You break it, you buy it!'}
  end
end
