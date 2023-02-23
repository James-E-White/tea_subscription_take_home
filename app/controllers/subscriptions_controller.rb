class SubscriptionsController < ApplicationController
  def create
    new_subscription = Subscription.new(new_params)
  end

  private

  def new_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end