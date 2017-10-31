class RequestfordmsController < ApplicationController

  before_action :set_requestfordms, only: [:show, :edit, :update, :destroy]

  def create
    #@passengerride =  Passengerride.find_by_id (params[:passengerride_id])
    #@requestfordm = @passengerride.requestfordm.new(requestfordms_params)
    @requestfordm = Requestfordm.new(requestfordms_params)

    if @requestfordm.save

      flash[:success] = 'Request sent.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update

    if @requestfordm.update(requestfordms_params)
      flash[:success] = 'Accepted'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def updatestatus
    @requestfordm = Requestfordm.find params[:id]
    puts "@status"
    @requestfordm.update_column(:status,"Accepted")
    flash[:success] = 'Offer accepted'
    redirect_to root_path
  end

  def index
    @requestfordm = Requestfordm.all
  end

  def show
  end

  def destroy
    @requestfordm = Requestfordm.find(params[:id])
    @requestfordm.destroy
    flash[:danger] = "Offer declined"
    redirect_to root_path
  end

  # PATCH/PUT /requestfordmss/1
  # PATCH/PUT /requestfordmss/1.json

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_requestfordms
    @requestfordm = Requestfordm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requestfordms_params
    params.require(:requestfordm).permit(:driverride_id, :customer_id, :status)
  end

end
