# frozen_string_literal: true

module Admin
  class KudosController < AdminController
    # GET /admin/kudos
    def index
      @kudos = Kudo.all.includes([:company_value])
    end

    # GET /admin/kudos/1
    def show
      set_kudo
    end

    # POST /admin/kudos
    def create
      @kudo = Kudo.new(kudo_params)
    end

    # DELETE /admin/kudos/1
    def destroy
      set_kudo
      @kudo.destroy
      redirect_to admin_kudos_url, notice: 'Kudo was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kudo_params
      params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id, :company_value_id)
    end
  end
end
