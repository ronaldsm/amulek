class CompanionshipsController < ApplicationController
  def index
  end

  def create
     render plain: params[:companionship].inspect
  end

  def new

  end
end
