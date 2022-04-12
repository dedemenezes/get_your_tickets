class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart.joins(:line_items)
  end
end
