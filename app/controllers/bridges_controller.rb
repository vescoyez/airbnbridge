class BridgesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :show_comments]
  before_action :set_bridge, only: [:show, :edit, :update, :destroy, :show_comments]

  def index
    if params[:city]
      @bridges = Bridge.near(params[:city], 20)
    else
      @bridges = Bridge.all
    end
  end

  def new
    @bridge_type = Bridge::BRIDGE_TYPES
    @bridge = Bridge.new
  end

  def create
    @bridge = current_user.bridges.build(bridge_params)
    @bridge_type = Bridge::BRIDGE_TYPES
    respond_to do |format|
      if @bridge.save
        format.html { redirect_to @bridge, notice: 'Bridge was successfully created.' }
        format.json { render :show, status: :created, location: @bridge }
      else
        format.html { render :new }
        format.json { render json: @bridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.where(bridge_id: params[:id])
  end

  def edit
    @bridge_type = Bridge::BRIDGE_TYPES
  end

  def update
    @bridge_type = Bridge::BRIDGE_TYPES
    respond_to do |format|
      if @bridge.update(bridge_params)
        format.html { redirect_to @bridge, notice: 'Bridge was successfully updated.' }
        format.json { render :show, status: :created, location: @bridge }
      else
        format.html { render :edit }
        format.json { render json: @bridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bridge.destroy
    respond_to do |format|
      format.html { redirect_to bridges_url, notice: 'Bridge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_comments
    @comments = @bridge.comments
  end

  private

  def set_bridge
    @bridge = Bridge.find(params[:id])
  end

  def bridge_params
    params.require(:bridge).permit([:name, :bridge_type, :description, :capacity, :country, :city, :address, :price])
  end
end
