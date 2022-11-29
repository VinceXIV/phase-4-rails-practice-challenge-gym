class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    def index
        render json: Gym.all, status: :ok
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end

    private
    def record_not_found
        render json: {error: "Gym not found"}, status: 404
    end

    def gym_params
        params.permit(:name, :address)
    end
end
