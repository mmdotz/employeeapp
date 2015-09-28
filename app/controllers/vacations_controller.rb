class VacationsController < ApplicationController
  def index
    all_vacations_for_employee = Vacation.where(employee_id: params[:employee_id])
    render json: all_vacations_for_employee.to_json, status: 200
  end

  def create_date
      updated_vacation                = Vacation.where(employee_id: params[:employee_id])
       if updated_vacation            == nil
        render json: { error_msg: 'Employee is not found.', id: params[:id] }.to_json, status: 404
        updated_vacation.date_taken   = params[:date_taken]
        updated_vacation.save
      render json: updated_vacation.to_json, status: 200
    else
  end



end
