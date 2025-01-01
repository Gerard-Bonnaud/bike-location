class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profile
    @user = current_user
    @bikes = current_user.bikes
    @bike = Bike.new

    # Mes réservations : Gonflables réservés par l'utilisateur
    @my_rents = @user.rents.includes(:bike)

    # Mes demandes de réservations : Réservations des gonflables appartenant à l'utilisateur
    @requests = Rent.joins(:bike).where(bikes: { user_id: @user.id }).includes(:user, :bike)
  end
end
