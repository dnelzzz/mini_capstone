class Api::ProductsController < ApplicationController
  before_action :authenticate_user, except :index

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
      description: params["input_description"],
      supplier_id: params["input_supplier_id"]
      )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["input_name"] || @product.name
    @product.price = params["input_price"] || @product.price
    @product.description = params["input_description"] || @product.description
    @product.supplier_id = params["input_supplier_id"] || @product.supplier_id

    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product 
      @product.destroy
    else
      render json: {Error: "This product doesn't exist"}
    end
  end
  
end
