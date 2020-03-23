class Product < ApplicationRecord
  belongs_to :supplier

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    total = price + tax
    return total
  end 

  # def supplier_name
  #   supplier = Supplier.find_by(id: supplier_id)
  #   return supplier.name
  # end 

end
