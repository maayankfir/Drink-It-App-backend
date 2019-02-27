module Api
  module V1
    class FavoritesController < ApplicationController

      def index
        @favorites = Favorite.all
        render json: @favorites
      end

      def create
        @favorite = Favorite.new(user_id: params[:user_id], cocktail_id: params[:cocktail_id])
        if @favorite.save
          render json: @favorite
        else
          render json: { error: 'WRONG'}, status: 422
        end
      end

      def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
      end
    end

  end
end
