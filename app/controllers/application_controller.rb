class ApplicationController < ActionController::Base
  include CurrentCart

  before_action :authenticate_user!
  before_action :set_cart
end
