class ReimbursementController < ApplicationController
  include Authenticate
  def index
    if current_user.title == 'Manager'
      json status: [200, 'OK'], body: {reimbursement_requests: ReimbursementRequest.all}, headers: cors
    else
      json status: [200, 'OK'], body: {reimbursement_requests: ReimbursementRequest.where(personnel_id: current_user.id)}, headers: cors
    end
  end

  def create
    new_reimbursement = ReimbursementRequest.new(@request[:body])
    begin
      if new_reimbursement.save
        {status: [204, 'No Content'], headers: cors({'Location' => "/reimbursement/#{new_reimbursement.id}"})}
      else
        json status: [400, 'Bad Request'], body: {message: 'Invalid reimbursement request'}, headers: cors
      end
      rescue StandardError => e
    end
  end

  #Authentication should handle this so that only the user who created the reimbursement request can see it
  def show
    reimbursement = ReimbursementRequest.find(params[:id])
    json status: [200, 'OK'], body: {reimbursement_request: reimbursement}, headers: cors
  end

  def update
  end

  def destroy
  end
end
