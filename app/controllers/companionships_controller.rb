class CompanionshipsController < ApplicationController

  http_basic_authenticate_with name: "Ron", password: "welcome", except: [:show]

  def index
    @companionships = Companionship.all.order(id: :asc)
  end

  def edit
    @companionship = Companionship.find(params[:id])
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

  def update
    @companionship = Companionship.find(params[:id])

    if @companionship.update(companionship_params)
      redirect_to @companionship
    else
      render 'edit'
    end
  end

  private
  def companionship_params
    params.require(:companionship).permit(:label)
  end

end
