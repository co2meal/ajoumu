class CreatePaymentHistories < ActiveRecord::Migration
  def change
    create_table :payment_histories do |t|
      t.references :user
      t.integer :amount

      t.timestamps
    end
    add_index :payment_histories, :user_id
  end
end
