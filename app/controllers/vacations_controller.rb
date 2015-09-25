class VacationsController < ApplicationController
  def index
    vacations = Vacation.new
    render json: vacation, status: 200
  end

  def show
    vacation = vacation.find(params[:employee_id])
    render json: vacation, status: 200
  end

  def new
    new_employee: Employee.new
    render json: new_employee, status: 200
  end

  def create
    if params[:name].nil? || params[:task].empty?
      err_msg = "An 'employee' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      # todo = todo.create(task: params[:task])
      todo = Todo.new
      todo.task = params[:task]
      todo.save
      render json: todo.to_json, status: 201
    end
  end

  def update      #do we even need this because it wouldn't show on the page as a choice if it wasn't valid
    if Vacation.exists?(params[:employee_id])
      vacation                = Vacation.find(params[:employee_id])
      vacation.date_taken     = params.fetch(:vacation).fetch(:date_taken)
      vacation.days_left      = params.fetch(:vacation).fetch(:days_left)
      vacation.save
      render json: vacation.to_json, status: 200
    else
      render json: { error_msg: 'Employee vacation record not found.', id: params[:id] }.to_json, status: 404
    end

  def error
    render json: { error: 'There has been an error' }, status: 500
  end



  def destroy
    if Vacation.exists?(params[:employee_id])
      vacation = Vacation.find(params[:employee_sid])
      vacation.destroy
      render json: { message: "Vacation record deleted successfully." }, status: 200
    else
      render json: { error_msg: 'No vacation information found', id: params[:id] }.to_json, status: 404
    end
  end
  end
end
