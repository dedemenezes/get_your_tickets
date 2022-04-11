class Teather < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :exibithions, through: :rooms
  validates :name, :address, :city, presence: true

  def rooms_playing(movie)
    rooms.joins(:exibithions).where(exibithions: { movie: movie }).uniq
  end
end
