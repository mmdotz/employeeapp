class EmployeesController < ApplicationController
  def index
    employee = Employee.new
    render json: employee.to_json, status 200
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee.to_json, status 200
  end

  def new
  end

  def create
  end

  def update      #do we even need this because it wouldn't show on the page as a choice if it wasn't valid
    if Employee.exists?(params[:id])
      employee                = Employee.find(params[:id])
      employee.name           = params.fetch(:employee).fetch(:name)
      employee.dept           = params.fetch(:employee).fetch(:dept)
      employee.yrs_employed   = params.fetch(:employee).fetch(:yrs_employed)
      employee.position       = params.fetch(:employee).fetch(:position)
      employee.status         = params.fetch(:employee).fetch(:status)
      employee.pay            = params.fetch(:employee).fetch(:pay)
      employee.save
      render json: employee.to_json, status: 200
    else
      render json: { error_msg: 'Employee record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Employee.exists?(params[:id])
      employee = Employee.find(params[:id])
      employee.destroy
      render json: { message: "Employee terminated and record deleted successfully." }, status: 200
    else
      render json: { error_msg: 'No valid employee found', id: params[:id] }.to_json, status: 404
    end
  end
end
