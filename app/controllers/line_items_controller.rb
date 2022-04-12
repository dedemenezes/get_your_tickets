class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @line_item = LineItem.new
    @exibithion = Exibithion.find(params[:session_id])
    @seats = @exibithion.room.seats
  end

  def create
    binding.pry
    @exibithion = Exibithion.find(params[:exibithion_id])
    @line_item = LineItem.new
    @line_item.exibithion = @exibithion
    @line_item.room = @exibithion.room
    seat = Seat.find(choosen_seat_id.first)
    @line_item.seat = seat
    seat.update(available: false)
    if @line_item.save
      redirect_to movies_path
    else
      render :new
    end

  end

  private

  def choosen_seat_id
    params[:line_item][:seat_id].reject(&:blank?)
  end
  def line_item_params
    params.require(:line_item).permit(:seat_id)
  end
end
