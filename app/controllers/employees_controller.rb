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
    if Employee.exists?(params[:id])
      employee = Employee.find(params[:id])
      employee.**updated_param** = params[:some param]
      employee.save
      render json: employee.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Employee.exists?(params[:id])
      employee = Employee.find(params[:id])
      employee.destroy
      render json: { message: "Employee Terminated and record deleted successfully." }, status: 200
    else
      render json: { error_msg: 'No valid Employee Found', id: params[:id] }.to_json, status: 404
    end
  end
end
