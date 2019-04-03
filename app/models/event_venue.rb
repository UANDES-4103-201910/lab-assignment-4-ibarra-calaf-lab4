class EventVenue < ApplicationRecord
    validates: name, capacity, presence: true
	validates: name, length: {minimum: 20} 
	validates: capacity, numericality: {only_integer: true}, numericality: {greater_than: 0} 
end
