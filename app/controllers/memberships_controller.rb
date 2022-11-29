class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Membership.all
    end

    def create
        render json: Membership.create!(membership_params), status: 201
    end

    private
    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
