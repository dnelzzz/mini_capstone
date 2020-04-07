class Api::OrdersController < ApplicationController
  # before_action :authenticate_user
  # before_action :authenticate_user, except :index

  def index
    # @orders = current_user.orders
    @orders = Order.all
    render "index.json.jbuilder"
  end

  def create
    calculated_subtotal = 0
    calculated_tax = 0
    calculated_total = 0
    carted_products = current_user.carted_products.where(:status => "carted")
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price + carted_product.quantity
    end
    calculated_tax += calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save
    carted_products.each do |carted_product|
      # carted_product.status = "purchased"
      # carted_product.order_id = @order.id
      # carted_product.save
      carted_product.update(status: "purchased", order_id: @order.id)
    end
    render "show.json.jbuilder"

    # product = Product.find_by(id: params[:product_id])

    # @order = Order.new(
    #   product_id: params[:product_id],
    #   quantity: params[:quantity],
    #   user_id: current_user.id,
    #   subtotal: product.price * params[:quantity].to_i,
    #   tax: product.tax * params[:quantity].to_i,
    #   total: product.total * params[:quantity].to_i
    # )
    # @order.save
    # render "show.json.jbuilder"

  end
end
