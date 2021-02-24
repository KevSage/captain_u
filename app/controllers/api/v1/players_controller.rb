class Api::V1::PlayersController < ApplicationController
    def index
        @players = Player.all 
        render json: @players
    end
    def show
        @player = Player.find(params[:id])
        render json: @player
    end
    def playerInfo
        @player = Player.find(params[:player_id])
        @team = Team.find(params[:team_id])
        if @player.team == @team
            render json: @player
        else
            render json: { error: 'Player does not exist on this team' }, status: :not_acceptable
        end
    end
end
