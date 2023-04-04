require_relative 'concerns/authenticate'

class ReimbursementController < ApplicationController
  include Authenticate
  def index
    if current_user.title.to_i == 1
      render json: { reimbursement_requests: ReimbursementRequest.all }, status: :ok
    else
      render json: {reimbursement_requests: ReimbursementRequest.where(personnel_id: current_user.id)}, status: :ok
    end
  end

  def create
    new_reimbursement = ReimbursementRequest.new(JSON.parse(request.body.read).merge(personnel_id: current_user.id))
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
    puts "params[:id] = #{params[:id]}"
    reimbursement = ReimbursementRequest.where(id: params[:id]).first
    if reimbursement
      render json: {reimbursement_request: reimbursement}, status: :ok
    else
      render json: {message: "Reimbursement request with id #{params[:id]} not found"}, status: :not_found
    end

  end


  def update
    reimbursement = ReimbursementRequest.where(id: params[:id]).first
    if reimbursement
      if current_user.id == reimbursement.personnel_id || current_user.title.to_i == 1
        if reimbursement.update(JSON.parse(request.body.read))
          render json: {}, status: :no_content
        else
          render json: {message: 'Invalid reimbursement request'}, status: :bad_request
        end
      else
        render json: {message: 'Invalid token'}, status: :forbidden
      end
    else
      render json: {message: "Reimbursement request with id #{params[:id]} not found"}, status: :not_found
    end

  end

  def destroy
    reimbursement = ReimbursementRequest.where(id: params[:id]).first
    if reimbursement
      if current_user.title.to_i == 1
        reimbursement.destroy
        render json: {}, status: :no_content
      else
        render json: {message: 'Invalid token'}, status: :forbidden
      end
    else
      render json: {message: "Reimbursement request with id #{params[:id]} not found"}, status: :not_found
    end

  end
end
