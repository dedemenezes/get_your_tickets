class Teather < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, :address, :city, presence: true
end
