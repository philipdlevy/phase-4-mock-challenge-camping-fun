class SignupsController < ApplicationController

    def create 
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup, status: :created
        else
            # render json: {errors: "Unprocessable Entity" }, status: :unprocessable_entity
            render json: { error: "Validation Errors" }, status: :unprocessable_entity
        end

    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_entity_response
        render json: { error: "Unprocessable Entity" }, status: :unprocessable_entity
    end
end
