class CommentsController < ApplicationController
  before_action :set_bridge, only: [:index, :show, :new, :create]
  before_action :set_booking, only: [:index, :show, :new, :create]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.booking = @booking
    respond_to do |format|
      if @comment.save
        format.html { redirect_to bridge_path(@bridge), notice: 'Your review has been added.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def comment_params
    params.require(:comment).permit([:rating, :content, :booking_id])
  end
end
