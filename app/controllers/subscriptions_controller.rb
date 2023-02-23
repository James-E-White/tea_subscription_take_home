class SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create(new_params)
    if subscription.save
      body = SubscriptionSerializer.new(subscription)
      render json: body, status: 201
    else
      render json: "Some info missing, please try again", status: 400
    end
  end

  private

  def new_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end