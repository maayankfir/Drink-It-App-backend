module Api
  module V1
    class ProportionsController < ApplicationController

      def index
        @proportions = Proportion.all
      end

      def create
        # byebug
        @proportion = Proportion.create(proportion_params)

        render json: @proportion
      end

      def update
        @proportion = Proportion.find_by(cocktail_id: params[:cocktail_id].to_i)
        # byebug
        @proportion.update(proportion_params)
        # @proportion.proportions << @proportion
        render json: @proportion
      end

      def proportion_params
        params.require(:proportion).permit(:amount, :cocktail_id, :ingredient_id)
      end
    end
  end
end
