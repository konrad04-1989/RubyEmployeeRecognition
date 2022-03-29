# frozen_string_literal: true

module Admin
  class EmployeesController < AdminController
    before_action :find_employee, only: %i[show edit update destroy]

    # GET /admin/employees
    def index
      @employees = Employee.all
    end

    # GET /admin/employees/1
    def show; end

    # GET /admin/employees/1/edit
    def edit; end

    # PATCH/PUT /admin/employees/1
    def update
      params[:employee].delete(:password) if params[:employee][:password].blank?
      if @employee.update(employee_params)
        redirect_to admin_employees_path, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/employees/1
    def destroy
      @employee.destroy
      redirect_to admin_employees_path, notice: 'Employee was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def find_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:email, :password, :number_of_available_kudos)
    end
  end
end
