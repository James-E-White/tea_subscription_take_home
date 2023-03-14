class SubscriptionsController < ApplicationController
  before_action :find_customer 

  def create
    subscription = Subscription.create(subscription_params)
    if subscription.save
      body = SubscriptionSerializer.new(subscription)
      render json: body, status: 201
    else
      render json: 'Some info missing, please try again', status: 400
    end
  end

  def update
    subscription = Subscription.update(subscription_params)
    body = SubscriptionSerializer.new(subscription)
    render json: body, status: 201
  end

  def index
    if (customer = Customer.find(params[:customer_id]))
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: 201
    else
      render json: { error: 'Customer does not exist' }, status: 404
    end
  end

  def find_customer
    if Customer.exists?(params[:customer_id])
      @customer = Customer.find(params[:customer_id])
    else
      @customer = nil
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
