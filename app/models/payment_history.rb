class PaymentHistory < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: self.user.email, card: stripe_card_token)

      charge = Stripe::Charge.create(
        :amount => self.amount,
        :currency => "usd",
        :customer => customer.id
      )

      self.user.transaction do 
        self.user.credit += self.amount
        self.user.save!
      end

      save
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error: #{e.message}"
    errors.add :base, "There was a problem with payment."
    false
  end
end
