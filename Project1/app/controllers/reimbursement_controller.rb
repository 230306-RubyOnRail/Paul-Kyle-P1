require_relative 'concerns/authenticate'

class ReimbursementController < ApplicationController
  include Authenticate
  def index
    if current_user.title.to_i == 1
      render json: { reimbursement_requests: ReimbursementRequest.all }, status: :ok, headers: :cors
    else
      render json: {reimbursement_requests: ReimbursementRequest.where(personnel_id: current_user.id)}, status: :ok, headers: :cors
    end
  end

  def create
    new_reimbursement = ReimbursementRequest.new(@request[:body])
    begin
      if new_reimbursement.save
        render json: {},status: :created
      else
        render json: {message: 'Invalid reimbursement request'}, status: :bad_request
      end
      rescue StandardError => e
    end
  end

  #Authentication should handle this so that only the user who created the reimbursement request can see it
  def show
    reimbursement = ReimbursementRequest.find(params[:id])
    render json: {reimbursement_request: reimbursement}, status: :ok, headers: :cors
  end


  def update
    reimbursement = ReimbursementRequest.find(params[:id])
    if current_user = reimbursement.personnel_id
      if reimbursement.update(@request[:body])
        render json: {}, status: :no_content, headers: cors({'Location' => "/reimbursement/#{reimbursement.id}"})
      else
        render json: {message: 'Invalid reimbursement request'}, status: :bad_request
      end
    else
      render json: {message: 'Invalid token'}, status: :forbidden, headers: :cors
    end
  end

  def destroy
    reimbursement = ReimbursementRequest.find(params[:id])
    if current_user.title.to_i == 1
        reimbursement.destroy
        render json: {}, status: :no_content
    else
      render json: {message: 'Invalid token'}, status: :forbidden
    end
  end
end
