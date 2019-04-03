class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  has_many :orders
  validates :email, presence: true, email: true
  validates :password, presence: true, format:{with: /^[A-Za-z0-9]+$/}, length: {in:8..12}
  validates : phone, presence: true, numericality: {only_integer: true}, length: {in:9..12}
end
