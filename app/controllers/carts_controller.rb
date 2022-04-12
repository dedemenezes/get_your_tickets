class CartsController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!
  before_action :set_cart

  def show
  end
end
