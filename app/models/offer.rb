class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :matches
end
