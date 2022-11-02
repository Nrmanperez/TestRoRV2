class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sku, :stock, :status
  belongs_to :brand
  belongs_to :category
end
