class Api::V1::TeamsController < ApplicationController
    def index
        @teams = Team.all
        render json: @teams
    end
    def show
        @team = Team.find(params[:team_id])
        @tournament = Tournament.find(params[:tournament_id])
        if @tournament.teams.include?(@team) 
            render json: @team
        else
            render json: { error: 'This team will not be participating in this tournament.' }, status: :not_acceptable
        end
    end
    def get_players  
        @team = Team.find(params[:team_id])
        render json: @team.players.all
    end
end
