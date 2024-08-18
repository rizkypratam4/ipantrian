class WoList < ApplicationRecord
  has_many :production
  validates :nama_barang_1, :quantity, presence: true
end
