class Api::V1::TeamsController < ApplicationController
    def index
        @teams = Team.all
        render json: @teams
    end
    def show
        @team = Team.find(params[:id])
        render json: @team
    end
    def get_players  
        @team = Team.find(params[:id])
        render json: @team.players.all
    end
end
