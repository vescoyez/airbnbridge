class BridgesController < ApplicationController
  before_action :set_bridge, only: [:show, :edit, :update, :destroy]

  def index
    @bridges = Bridge.where(city: params[:city])
  end

  def new
    @bridge_type = Bridge::BRIDGE_TYPES
    @bridge = Bridge.new
  end

  def create
    @bridge = current_user.bridges.build(bridge_params)
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
  end

  def edit
  end

  def update
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

  private

  def set_bridge
    @bridge = Bridge.find(params[:id])
  end

  def bridge_params
    params.require(:bridge).permit([:name, :bridge_type, :description, :capacity, :country, :city, :address, :price])
  end
end
