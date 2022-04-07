class Exibithion < ApplicationRecord
  belongs_to :room
  belongs_to :movie
  validates :start_time, presence: true
  validate :start_time_cannot_be_in_the_past

  private

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time.past?
      errors.add(:start_time, "The session can't be in the past")
    end
  end
end
