class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    selected = Product.where(name: params[:input_name])
    if selected.length > 0
      @products = selected
    end
    @sorted_products = @products.sort_by { |product| product[:id] }
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params["input_name"],
      price: params["input_price"],
      image_url: params["input_image_url"],
      description: params["input_description"]
      )
    @product.save
    render "show.json.jbuilder"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["input_name"] || @product.name
    @product.price = params["input_price"] || @product.price
    @product.image_url = params["input_image_url"] || @product.image_url
    @product.description = params["input_description"] || @product.description
    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
  end
  
end
