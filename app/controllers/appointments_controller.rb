class AppointmentsController < ApplicationController


  def index
    @appointments = Appointment.all
  end

  def create
    @companionship = Companionship.find(params[:companionship_id])
    @appointment = @companionship.appointments.create(appointment_params)
    redirect_to companionship_path(@companionship)
  end


  # def create
  #   @article = Article.find(params[:article_id])
  #   @comment = @article.comments.create(comment_params)
  #   redirect_to article_path(@article)
  # end

  def destroy
    @companionship = Companionship.find(params[:companionship_id])
    @appointment = @companionship.appointments.find(params[:id])
    @appointment.destroy
    redirect_to companionship_path(@companionship)
  end

  def new
    @appointment = Appointment.new
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :family, :contact_info, :other_info)
  end
end
