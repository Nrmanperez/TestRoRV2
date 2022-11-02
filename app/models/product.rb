class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand
    validates :name, :description, :sku, :stock, :status, presence: true
end
