class LineItemsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @line_item = LineItem.new
    @exibithion = Exibithion.find(params[:session_id])
    @available_seats = @exibithion.available_seats
  end

  def create
    @exibithion = Exibithion.find(params[:exibithion_id])
    @line_item = LineItem.new
    @line_item.exibithion = @exibithion
    @line_item.room = @exibithion.room
    @line_item.cart = @cart
    @seat = Seat.find(line_item_params[:seat_id]).first
    @line_item.seat = @seat
    if @line_item.save
      @seat.mark_as_occupied!
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(seat_id: [])
  end
end
