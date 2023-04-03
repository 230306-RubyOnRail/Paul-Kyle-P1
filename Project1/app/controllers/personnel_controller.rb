class PersonnelController < ApplicationController
  include Authenticate
  def index
    if current_user.title == 'Manager'
      render json: { personnel: Personnel.all }, status: :ok, headers: :cors
    else
      render json: {message: 'Invalid token'}, status: :unauthorized, headers: :cors
    end
  end

  def create
    if current_user.title == 'Manager'
      new_personnel = Personnel.new(@request[:body])
      begin
        if new_personnel.save
          render json: status: [201, 'Created'], headers: cors({'Location' => "/personnel/#{new_personnel.id}"})
        else
          json status: [400, 'Bad Request'], body: {message: 'Invalid personnel creation'}, headers: cors
        end
        rescue StandardError => e
      end
    else
      json status: [401, 'Unauthorized'], body: {message: 'Invalid token'}, headers: cors
    end
  end

  def show
    personnel = Personnel.find(params[:id])
    json status: [200, 'OK'], body: {personnel: personnel}, headers: cors
  end

  #Should managers be able to update personnel information?
  # In this code the manager can only update their own information
  def update
    personnel = Personnel.find(params[:id])
    begin
      if personnel.id == current_user.id
        personnel.update(@request[:body])
        {status: [204, 'No Content'], headers: cors({'Location' => "/personnel/#{personnel.id}"})}
      else
        json status: [401, 'Unauthorized'], body: {message: 'Invalid token'}, headers: cors
      end
      rescue StandardError => e
    end
  end

  def destroy
    personnel = Personnel.find(params[:id])
    @id = personnel.id
    begin
      if personnel.title == 'Manager'
        personnel.destroy
        {status: [204, 'No Content'], headers: cors({'Location' => "/personnel/#{@id}"})}
      else
        json status: [401, 'Unauthorized'], body: {message: 'Invalid token'}, headers: cors
      end
      rescue StandardError => e
    end
  end

end