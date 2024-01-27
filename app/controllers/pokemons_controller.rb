class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  # GET /pokemons
  # Retrieve a list of all pokemons
  def index
    @pokemons = Pokemon.all

    render json: @pokemons
  end

  # GET /pokemons/1
  # Retrieve details of a specific pokemon
  def show
    render json: @pokemon
  end

  # POST /pokemons
  # Create a new pokemon
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  # Update details of a specific pokemon
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  # Delete a specific pokemon
  def destroy
    @pokemon.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Set the current pokemon based on the provided ID parameter
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Define the allowed parameters for creating or updating a pokemon
    def pokemon_params
      params.require(:pokemon).permit(:name, :pokemonType, :level, :evolutionOf, :nextEvolution, :description)
    end
end
