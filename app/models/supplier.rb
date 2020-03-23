class Supplier < ApplicationRecord
  has_many :products

  # def products
  #   Product.where(supplier_id: id)
  # end

  validates :name, presence: true
  validates :name, uniqueness: true

end
