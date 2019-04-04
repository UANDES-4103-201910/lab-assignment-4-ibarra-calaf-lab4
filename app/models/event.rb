class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validate :later_than_current_date
  validate :two_or_more_events
  validates :start_date, presence: true

  def later_than_current_date
    if start_date<Date.today
      erros.add(:start_date,"Date can't be before current date")
    end
  end

  def two_or_more_events
    if Event.where(event_venue_id:event_venue_id, start_date:start_date).count()>0
      erros.add("There cannot be two or more events hosted in the same venue with the same start date")
    end
  end
end