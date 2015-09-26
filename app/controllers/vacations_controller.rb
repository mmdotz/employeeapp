class VacationsController < ApplicationController
  def index
    all_vacations_for_employee = Vacation.where(employee_id: params[:employee_id])
    render json: all_vacations_for_employee.to_json, status: 200
  end

  def update
      updated_vacation                = Vacation.where(employee_id: params[:employee_id])
      updated_vacation.date_taken     = params.fetch(:vacation).fetch(:date_taken)
      vacation.save
      render json: vacation.to_json, status: 200
    else
      render json: { error_msg: 'Employee vacation record not found.', id: params[:id] }.to_json, status: 404
    end

  # def destroy
  #   if Vacation.exists?(params[:employee_id])
  #     vacation = Vacation.find(params[:employee_sid])
  #     vacation.destroy
  #     render json: { message: "Vacation record deleted successfully." }, status: 200
  #   else
  #     render json: { error_msg: 'No vacation information found', id: params[:id] }.to_json, status: 404
  #   end
  # end
  # end
end
