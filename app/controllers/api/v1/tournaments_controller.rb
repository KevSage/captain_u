class Api::V1::TournamentsController < ApplicationController
    def index
        @tournaments = Tournament.all
        render json: @tournaments
    end
    def show
        @tournament = Tournament.find(params[:id])
        render json: @tournament
    end
    def get_teams 
        @tournament = Tournament.find(params[:tournament_id])
        render json: @tournament.teams.all
    end
end
