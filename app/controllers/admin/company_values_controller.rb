# frozen_string_literal: true

module Admin
  class CompanyValuesController < AdminController

    # GET /admin/company_values
    def index
      @company_values = CompanyValue.all
    end

    # GET /admin/company_values/1
    def show
      set_company_value
    end

    # GET /admin/company_values/new
    def new
      @company_value = CompanyValue.new
    end

    # GET /admin/company_values/1/edit
    def edit
      set_company_value
    end

    # POST /admin/company_values
    def create
      @company_value = CompanyValue.new(company_value_params)
      if @company_value.save
        redirect_to admin_company_values_path, notice: 'Company Value was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/company_values/1
    def update
      set_company_value
      if @company_value.update(company_value_params)
        redirect_to admin_company_values_path, notice: 'Company Value was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/company_values/1
    def destroy
      set_company_value
      @company_value.destroy
      redirect_to admin_company_values_url, notice: 'Company Value was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_company_value
      @company_value = CompanyValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_value_params
      params.require(:company_value).permit(:title)
    end
  end
end
