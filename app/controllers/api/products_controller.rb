class Api::ProductsController < ApplicationController
  def weakest_action
    @characters = Product.all
    render 'weakest_view.json.jb'
  end

  def farmer_action
    @character = Product.find_by(name: "Farmer")
    render 'farmer_view.json.jb'
  end

  def tien_action
    @character = Product.find_by(name: "Tien")
    render 'tien_view.json.jb'
  end
end
