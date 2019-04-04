class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :created_after
  before_save :bought_later
  
  def created_after
      if Order.find(order_id).created_at>Event.find(TicketType.find(ticket_type_id).event_id).start_date
        puts("A ticket cannot be created after the start date of the associated event")
        throw :abort
      end
  end
  def bought_later
      if Event.find(TicketType.find(ticket_type_id).event_id).start_date>=Date.today
        puts("No ticket can be bought after the start date of the event")
        throw :abort
      end
  end
end
