class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone

  validates: price, presence: true
	validates: price, numericality: {only_integer: true}, numericality: {greater_than: 0}
end
