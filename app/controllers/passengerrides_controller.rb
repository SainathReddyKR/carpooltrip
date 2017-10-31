class PassengerridesController < ApplicationController

  before_action :para_passengerride, only: [:edit, :update, :show]
  load_and_authorize_resource :except => :create

  def index
    @q = Passengerride.ransack(params[:q])
    @passengerrides = @q.result(distict: true)
  end

  def new
    @passengerride = Passengerride.new
  end

  def show
    @requestforpm = Requestforpm.new(passengerride_id: @passengerride.id)
  end

  def edit
  end

  def create

    @passengerride = Passengerride.new(passengerride_params)
    @passengerride.user = current_user
    if @passengerride.save
      flash[:success] = 'Ride was successfully created.'
      redirect_to passengerride_path(@passengerride)
    else
      render 'new'
    end
  end

  def update

    @passengerride.user = current_user
    if @passengerride.update(passengerride_params)
      flash[:success] = 'Ride was successfully updated'
      redirect_to passengerride_path(@passengerride)
    else
      render 'edit'
    end
  end


  def destroy
    @passengerride = Passengerride.find(params[:id])
    @passengerride.destroy
    flash[:danger] = "Ride has been deleted successfully"
    redirect_to passengerrides_path
  end


  private

  def para_passengerride
    @passengerride = Passengerride.find(params[:id])
  end

  private

  def passengerride_params
    params[:passengerride][:sharegasmoney] = params[:passengerride][:sharegasmoney].join(', ')
    params[:passengerride][:okwithgender] = params[:passengerride][:okwithgender].join(', ')
    params[:passengerride][:okwith] = params[:passengerride][:okwith].join(', ')
    params.require(:passengerride).permit(:origin, :destination, :departuretime, :departuredate, :okwithgender, :okwith, :sharegasmoney, :description)
  end

end