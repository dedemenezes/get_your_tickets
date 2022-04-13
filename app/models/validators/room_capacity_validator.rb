module Validators
  class RoomCapacityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return unless value.present? && value > record.room.capacity

      record.errors.add attribute, (options[:message] || "This room can't have more seats")
    end
  end
end
