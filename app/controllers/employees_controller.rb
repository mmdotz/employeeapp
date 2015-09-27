class EmployeesController < ApplicationController
  def index
    employee = Employee.all
    # render json: employee.to_json(:include => :vacations), status: 200 #this doesn't work in heroku
    render json: employee.to_json, status: 200
  end

  def show
    if Employee.exists?(params[:id])
      employee = Employee.find(params[:id])
      render json: employee.to_json, status: 200
    else
      render json: { error_msg: 'No such employee id:', id: params[:id] }.to_json, status: 404
    end
  end

  def days_left #needs a custom route
    left = Employee.where(days_left: params[:days_left])
    if left == nil
      render json: { error_msg: "No employees with #{params[:days_left]} days left."}.to_json, status: 404
    else
      render json: left.to_json, status: 200
    end
  end

  def status
    status = Employee.where(status: params[:status])
    if status == nil
      render json: { error_msg: "No employees with #{params[:status]} status."}.to_json, status: 404
    else
      render json: status.to_json, status: 200
    end
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

    # employee.vacations.build(

    #   )
    employee.save
    render json: employee.to_json, status: 200
  end

  def update
    if Employee.exists?(params[:id])
      employee                = Employee.find(params[:id])
      employee.name           = params.fetch(:name, employee.name)
      employee.dept           = params.fetch(:dept, employee.dept)
      employee.yrs_employed   = params.fetch(:yrs_employed, employee.yrs_employed)
      employee.position       = params.fetch(:position, employee.position)
      employee.status         = params.fetch(:status, employee.status)
      employee.pay            = params.fetch(:pay, employee.pay)
      employee.days_left      = params.fetch(:days_left, employee.days_left)
      employee.save
      render json: employee.to_json, status: 200
    else
      render json: { error_msg: 'Employee record not found.', id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Employee.exists?(params[:id])
      employee = Employee.find(params[:id])
      employee.destroy
      render json: { message: "Employee terminated and record deleted successfully." }, status: 200
    else
      render json: { error_msg: 'No valid employee found.', id: params[:id] }.to_json, status: 404
    end
  end


end
