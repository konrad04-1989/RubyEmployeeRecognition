# frozen_string_literal: true

class KudosController < ApplicationController
  before_action :set_kudo, only: %i[show edit update destroy]
  before_action :authenticate_employee!
  before_action :correct_employee, only: %i[edit update destroy]

  # GET /kudos
  def index
    @kudos = Kudo.all
  end

  # GET /kudos/1
  def show; end

  # GET /kudos/new
  def new
    @kudo = Kudo.new
  end

  # GET /kudos/1/edit
  def edit; end

  # POST /kudos
  def create
    if current_employee.number_of_available_kudos.positive?
      @kudo = Kudo.new(kudo_params)

      if @kudo.save
        current_employee.number_of_available_kudos -= 1
        current_employee.save!
        redirect_to @kudo, notice: 'Kudo was successfully created.'
      else
        render :new
      end
    else
      redirect_to kudos_path, alert: 'Sorry, you cannot give another Kudo.'
    end
  end

  # PATCH/PUT /kudos/1
  def update
    if @kudo.update(kudo_params)
      redirect_to @kudo, notice: 'Kudo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kudos/1
  def destroy
    @kudo.destroy
    redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
  end

  def correct_employee
    redirect_to kudos_path, notice: "You aren't authorized to access this Kudo." unless @kudo.giver_of_kudo == current_employee
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kudo
    @kudo = Kudo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
