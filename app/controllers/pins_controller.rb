class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index] #Filtro que valida si esta autenticado
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.order("created_at desc").page(params[:page]).per_page(9);
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :image_file_name, :image_remote_url)
    end
  
    def latest
      @pins = Pin.order("created_at desc").limit(5);
      respond_with(@pins)
    end

end
