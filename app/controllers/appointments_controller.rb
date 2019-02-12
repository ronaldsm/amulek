class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    @companionship = Companionship.find(params[:companionship_id])
    @appointment = @companionship.appointments.create(appointment_params)
    redirect_to calendar_path_url(@companionship)
  end

  def edit
    @companionship = Companionship.find(params[:companionship_id])
    @appointment = Appointment.find(params[:id])
    @appointment_date = @appointment[:date]
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to calendar_path_url(@appointment.companionship)
    else
      render 'edit'
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to calendar_path_url(@appointment.companionship[:id])
  end

  def new
    @companionship = Companionship.find(params[:companionship_id])
    @appointment_date = Date.parse params[:date]
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :family, :contact_info, :other_info)
  end
end
