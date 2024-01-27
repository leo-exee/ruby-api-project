# ChampionsController handles CRUD operations for Champion resources.
class ChampionsController < ApplicationController
  # Before executing certain actions, set_champion method is called to find and set the @champion instance variable.
  before_action :set_champion, only: %i[show update destroy]

  # GET /champions
  # Retrieve a list of all champions.
  def index
    @champions = Champion.all

    render xml: @champions.as_json
  end

  # GET /champions/1
  # Show details of a specific champion.
  def show
    render xml: @champion.as_json
  end

  # POST /champions
  # Create a new champion.
  def create
    @champion = Champion.new(champion_params)

    if @champion.save
      render xml: @champion.as_json, status: :created, location: @champion
    else
      render xml: @champion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /champions/1
  # Update the details of a specific champion.
  def update
    if @champion.update(champion_params)
      render xml: @champion.as_json
    else
      render xml: @champion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /champions/1
  # Delete a specific champion.
  def destroy
    @champion.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
      #Set the current champion based on the provided ID parameter.
    def set_champion
      @champion = Champion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
      # Define the permitted parameters for creating or updating a champion.
    def champion_params
      params.require(:champion).permit(:name, :championType, :difficulty, :price)
    end
end
