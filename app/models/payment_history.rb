class PaymentHistory < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount
end
