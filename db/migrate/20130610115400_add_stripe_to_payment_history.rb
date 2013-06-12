class AddStripeToPaymentHistory < ActiveRecord::Migration
  def change
    add_column :payment_histories, :stripe_card_token, :string
  end
end
