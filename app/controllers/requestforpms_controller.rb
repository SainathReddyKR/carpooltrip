class RequestforpmsController < ApplicationController

  before_action :set_requestforpms, only: [:show, :edit, :update, :destroy]

  def create
    #@passengerride =  Passengerride.find_by_id (params[:passengerride_id])
    #@requestforpm = @passengerride.requestforpm.new(requestforpms_params)
    @requestforpm = Requestforpm.new(requestforpms_params)

      if @requestforpm.save

        flash[:success] = 'Request sent.'
        redirect_to root_path
      else
        render 'new'
      end
  end

  def update

    if @requestforpm.update(requestforpms_params)
      flash[:success] = 'Accepted'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def updatestatus
    @requestforpm = Requestforpm.find params[:id]
    puts "@status"
    @requestforpm.update_column(:status,"Accepted")
    flash[:success] = 'Offer accepted'
    redirect_to root_path
  end

  def index
    @requestforpm = Requestforpm.all
  end

  def show
  end

  def destroy
    @requestforpm = Requestforpm.find(params[:id])
    @requestforpm.destroy
    flash[:danger] = "Offer declined"
    redirect_to root_path
  end

  # PATCH/PUT /requestforpmss/1
  # PATCH/PUT /requestforpmss/1.json

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_requestforpms
    @requestforpm = Requestforpm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requestforpms_params
    params.require(:requestforpm).permit(:passengerride_id, :customer_id, :status)
  end
  
end
