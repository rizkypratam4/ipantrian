class ProductionsController < ApplicationController

  def index
    @productions = Production.where(status_production: nil).includes(:wo_list)
  end

  def show
    @production = Production.find(params[:id])
  end


  def mark_complete
    @production = Production.find(params[:id])
    if @production.update(status_production: true)
      redirect_to productions_path
    else
      redirect_to productions_path, notice: "Produksi belum selesai"
    end
  end

  def reschedule
    production = Production.find(params[:id])
    production.update(reschedule: true, reschedule_date: Time.now)
    redirect_to production_path, notice: 'Item telah dijadwalkan ulang.'
  end


  private
    def set_production
      @production = Production.find(params[:id])  
    end
end
