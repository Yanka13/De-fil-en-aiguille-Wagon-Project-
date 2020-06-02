class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :matches
  validates :price, presence: true
end
