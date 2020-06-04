class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :matches, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :offers, through: :matches
  accepts_nested_attributes_for :matches
end
