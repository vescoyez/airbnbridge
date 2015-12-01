class BridgesController < ApplicationController
  def index
    @bridges = Bridge.all
  end

  def new
    @bridge = Bridge.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
