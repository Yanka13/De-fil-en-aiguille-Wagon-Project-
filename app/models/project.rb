class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :matches
  has_many :offers, through: :matches
end