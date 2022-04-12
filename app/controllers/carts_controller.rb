class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found

  def show
    @cart = Cart.find(params[:id]) unless @cart.id == params[:id]
  end

  private

  def cart_not_found
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: 'Invalid cart'
  end
end
