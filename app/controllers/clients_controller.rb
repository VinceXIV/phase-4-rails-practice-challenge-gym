class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json: Client.all
    end

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    end

    def index
        render json: Client.all, status: :ok
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :ok
    end

    private
    def record_not_found
        render json: {error: "Client not found"}, status: 404
    end

    def client_params
        params.permit(:name, :age)
    end
end
