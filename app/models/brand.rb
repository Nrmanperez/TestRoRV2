class Brand < ApplicationRecord
    has_many :products
    belongs_to :product
    validates :name, presence: true
end
