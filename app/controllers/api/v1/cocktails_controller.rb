module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }

        render json: cocktail_json
      end

      def create
        # byebug
        @cocktail = Cocktail.create(cocktail_params)
        render json: @cocktail
      end

      def edit
        @cocktail = Cocktail.find(params[:id])
      end

      # def update
      #   @cocktail = Cocktail.find(params[:id].to_i)
      #   # byebug
      #   @cocktail.update(cocktail_params)
      #
      #   render json: @cocktail
      # end

      def destroy
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy
      end

      def cocktail_params
        params.require(:cocktail).permit(:id, :name, :description, :instructions, :proportions)
      end
    end
  end
end
