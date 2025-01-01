class RentsController < ApplicationController
  before_action :set_rent, only: %i[accept reject]

  def create
    @rent = Rent.new(rent_params)
    @bike = Bike.find(params[:bike_id])
    @rent.bike_id = @bike.id
    @rent.user = current_user
    if @rent.save
      redirect_to user_profile_path
      flash[:notice] = "Vélo bien ajouté à mes réservations"
    else
      render :new, alert: "Erreur, impossible d'ajouter le vélo à mes reservations, Réessayez !"
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to user_profile_path, notice: "Votre réservation a bien était supprimée."
  end

  def accept
    @rent = Rent.find(params[:id])
    @rent.update(statut: "Accepté")
    redirect_to user_profile_path, notice: "Réservation acceptée."
  end

  def reject
    @rent = Rent.find(params[:id])
    @rent.update(statut: "Rejeté")
    redirect_to user_profile_path, alert: "Réservation rejetée."
  end

  private

  def rent_params
    params.require(:rent).permit(:bike_id, :date_debut, :date_fin, :statut)
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
