class VacationsController < ApplicationController
  def index
    vacations = Vacation.new
    render json: vacation, status 200
  end

  def show
    vacation = vacation.find(params[:id])
    render json: employee, status 200
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
