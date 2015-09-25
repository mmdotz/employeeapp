class EmployeesController < ApplicationController
  def index
    employee = Employee.new
    render json: employee, status 200
  end

  def show
    employee = Employee.find(params[:id])
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
