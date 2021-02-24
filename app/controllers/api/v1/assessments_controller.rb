class Api::V1::AssessmentsController < ApplicationController
    def index
        @assessments = Assessment.all
        render json: @assessments
    end

    # POST /assessments
  def create
    @assessment = Assessment.new(assessment_params)

    if @assessment.save
      render json: @assessment, status: :created
    else
      render json: @assessment.errors, status: :unprocessable_entity
    end
  end
    
    def player_assessments
        @player = Player.all.find(params[:player_id])
        render json: @player.assessments.all
    end


    def assessment_params
        params.require(:assessment).permit(:rating, :user_id, :tournament_id, :player_id, :assessment_type)
    end
end
