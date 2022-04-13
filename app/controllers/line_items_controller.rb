class LineItemsController < ApplicationController

  skip_before_action :authenticate_user!
  rescue_from ActionController::ParameterMissing, with: :missing_seat

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

  def build_line_item
    @line_item.exibithion = @exibithion
    @line_item.room = @exibithion.room
    @line_item.cart = @cart
    @seat = Seat.find(line_item_params[:seat_id]).first
    @line_item.seat = @seat
  end

  def missing_seat
    logger.error "Missing seat to exibithion #{params[:exibithion]}"
    redirect_to new_line_item_path(session_id: @exibithion.id), notice: 'Missing seat'
  end

  def line_item_params
    params.require(:line_item).permit(seat_id: [])
  end
end
