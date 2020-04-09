class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    @product.save
    redirect_to "/products"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
end
