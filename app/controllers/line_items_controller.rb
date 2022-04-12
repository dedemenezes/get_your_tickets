class LineItemsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @line_item = LineItem.new
    @exibithion = Exibithion.find(params[:session_id])
    @available_seats = @exibithion.available_seats
  end

  def create
    @exibithion = Exibithion.find(params[:exibithion_id])
    @seat = Seat.find(choosen_seat_id.first)
    @line_item = LineItem.new(accepted_params)
    if @line_item.save
      @seat.mark_as_occupied!
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  private

  def accepted_params
    {
      exibithion: @exibithion,
      room: @exibithion.room,
      seat: @seat,
      cart: @cart
    }
  end

  def choosen_seat_id
    params[:line_item][:seat_id].reject(&:blank?)
  end

  def line_item_params
    params.require(:line_item).permit(:seat_id)
  end
end
