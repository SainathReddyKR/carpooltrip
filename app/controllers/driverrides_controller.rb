class DriverridesController < ApplicationController

  before_action :para_driverride, only: [:edit, :update, :show]
  load_and_authorize_resource :except => :create

  def index
    @q = Driverride.ransack(params[:q])
    @driverrides = @q.result(distict: true)
  end

  def new
    @driverride = Driverride.new
  end

  def show
    @requestfordm = Requestfordm.new(driverride_id: @driverride.id)
  end

  def edit
  end

  def create

    @driverride = Driverride.new(driverride_params)
    @driverride.user = current_user
    if @driverride.save
      flash[:success] = 'Ride was successfully created.'
      redirect_to driverride_path(@driverride)
    else
      render 'new'
    end
  end

  def update

    @driverride.user = current_user
    if @driverride.update(driverride_params)
      flash[:success] = 'Ride was successfully updated'
      redirect_to driverride_path(@driverride)
    else
      render 'edit'
    end
  end


  def destroy
    @driverride = Driverride.find(params[:id])
    @driverride.destroy
    flash[:danger] = "Ride has been deleted successfully"
    redirect_to driverrides_path
  end


  private

  def para_driverride
    @driverride = Driverride.find(params[:id])
  end

  private

  def driverride_params
    params[:driverride][:sharegasmoney] = params[:driverride][:sharegasmoney].join(', ')
    params[:driverride][:okwithgender] = params[:driverride][:okwithgender].join(', ')
    params[:driverride][:okwith] = params[:driverride][:okwith].join(', ')
    params.require(:driverride).permit(:origin, :destination, :departuretime, :departuredate, :okwithgender, :okwith, :sharegasmoney, :seatsavailable, :description)
  end

end