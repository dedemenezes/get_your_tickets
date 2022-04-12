class CartsController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart = Cart.find(params[:id]) unless @cart.id == params[:id]
  end
end
