class Api::V1::EntriesController < ApplicationController
    def index
        @entries = Entry.all
        render json: @entries
    end
end
