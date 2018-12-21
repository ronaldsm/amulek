class CompanionshipsController < ApplicationController

  def index
    @companionships = Companionship.all
  end

  def create
    @companionship = Companionship.new(companionship_params)

    @companionship.save
    redirect_to @companionship
  end

  def destroy
    @companionship = Companionship.find(params[:id])

    @companionship.destroy
    redirect_to companionships_path
  end

  def show
    @companionship = Companionship.find(params[:id])
  end

  def new
    @companionship = Companionship.new
  end

  private
  def companionship_params
    params.require(:companionship).permit(:label)
  end

end
