class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :offers, dependent: :destroy # if we delete a user we want to delete his offers
  has_many :products, through: :projects
  has_many :products, through: :offers
  has_many :matches, through: :projects
  has_many :matches, through: :offers
end
