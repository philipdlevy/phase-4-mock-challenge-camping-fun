class CampersController < ApplicationController

    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        # byebug
        if camper.valid?
            render json: camper, include: :activities 
        else 
            return render_error_response
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else 
            render json: { error: "Unproccessable Entity" }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_error_response
        render json: { error: "Can't find camper" }, status: :not_found
    end
end
