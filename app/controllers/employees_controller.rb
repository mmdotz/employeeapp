class EmployeesController < ApplicationController
  def index
    employee = Employee.all
    render json: employee.to_json, status: 200
  end

  def show
    if Employee.exists?(params[:id])
    employee = Employee.find(params[:id])
    render json: employee.to_json, status: 200
  else
    render json: { error_msg: 'No such employee id', id: params[:id] }.to_json, status: 404

  end

  def create
    employee = Employee.new
    employee.name           = params[:name]
    employee.dept           = params[:dept]
    employee.yrs_employed   = params[:yrs_employed]
    employee.position       = params[:position]
    employee.status         = params[:status]
    employee.pay            = params[:pay]
    employee.days_left      = params[:days_left]
    employee.save
    render json: employee.to_json, status: 200
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
      employee.days_left      = params.fetch(:employee).fetch(:days_left)
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
