class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]

  def index
    @bikes = Bike.all
  end

  def show
    @bikes = Bike.find(params[:id])
    @rent = Rent.new
  end

  def new
    @bike = Bike.new
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    respond_to do |format|
      if @gonflable.save
        format.html { redirect_to @gonflable, notice: "Votre Gonflable est bien créé" }
        format.json
      else
        format.html { redirect_to user_profile_path, notice: "Votre Gonflable n'a pas été créé" }
        format.json
      end
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: "Votre Vélo a été modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bike.destroy
    redirect_to user_profile_path, notice: "Votre Vélo a été supprimé avec succès."
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :price, :content, :rating, :photo)
  end
end
