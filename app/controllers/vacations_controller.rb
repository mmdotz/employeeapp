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
    render json: locals: { new_post: Post.new }

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

  def error
    render json: { error: 'There has been an error' }, status: 500
  end



  def destroy
  end
end
