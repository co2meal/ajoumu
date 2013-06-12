class PaymentHistoriesController < ApplicationController
  def new
    @payment_history = current_user.payment_histories.new
  end
  def create
    @payment_history = current_user.payment_histories.new(params[:payment_history])
    if @payment_history.save_with_payment
      redirect_to root_path, :notice => "Thank you for payment"
    else
      # raise @payment_history.inspect
      render :new
    end
  end
end
