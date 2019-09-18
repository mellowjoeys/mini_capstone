class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, only: [:create, :update, :destroy]
  "hello"
  def index 
    @products = Product.all

    search_term = params[:search]
    discount_option = params[:discount]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    category_preference = params[:category]
    discount_level = 300

    if category_preference
      category = Category.find_by(name: category_preference) 
      @products = category.products
    else
      @products = Product.all
    end

    if search_term
      @products = @products.where("name iLIKE ?", "%#{search_term}%")
    end

    # below 300 is discounted. 
    if discount_option == "true"
      @products = @products.where("price < ?", discount_level)
    end


    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    else
      @products = @products.order(:id)
    end

    render 'index.json.jb'
  end

  def create
    @product = Product.new(
                name: params[:name],
                price: params[:price],
                description: params[:description],
                supplier_id: params[:supplier_id]
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
