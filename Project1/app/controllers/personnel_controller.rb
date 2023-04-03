class PersonnelController < ApplicationController
  include Authenticate
  def index
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def authenticate(password)
    if this.pass == password
    end
  end
end