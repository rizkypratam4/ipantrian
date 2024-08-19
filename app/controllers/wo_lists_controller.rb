class WoListsController < ApplicationController
  def index
    @wolists = WoList.where(status: nil)
  end

  def import
    file = params[:file]
    spreadsheet = Roo::Spreadsheet.open(file.path)
  
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      
      wo_list = WoList.new(
        nama_barang_1: row['Nama Barang 1'],
        nama_barang_2: row['Nama Barang 2'],
        quantity: row['Quantity'].to_i,
        priority: row['Priority'].to_i
      )
      wo_list.save!
  
      row['Quantity'].to_i.times do
        Production.create!(
          wo_list_id: wo_list.id,
          status_production: nil,
          tanggal_selesai: nil
        )
      end
    end
    redirect_to wo_lists_path, notice: "Data berhasil diimport"
  end

    
    def clear_all 
     @wo_list = WoList.where(status: nil).update_all(status: true)
      respond_to do |format|
        format.html { redirect_to wo_lists_path, notice: 'Semua status yang nil berhasil diperbarui menjadi true.' }
        format.json { head :no_content }
      end
    end
    
end 
