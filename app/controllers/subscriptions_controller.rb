class SubscriptionsController < ApplicationController
  before_action :find_customer 

  def create
    subscription = Subscription.create(subscription_params)
    if subscription.save
      body = SubscriptionSerializer.new(subscription)
      render json: body, status: 201
    else
      render json: { error: 'Some info missing, please try again' }, status: 400
    end
  end

  def update
    if subscription = Subscription.update(subscription_params)
    body = SubscriptionSerializer.new(subscription)
    render json: body, status: 201
   else
    render json: { error: 'Unable to subscribe, please try again' }, status: 400
  end
 end

  def index
    if Customer.exists?(params[:customer_id])
      render json: SubscriptionSerializer.new(@customer.subscriptions)
    else  
      render json: { error: "customer does not exist" }, status: 400 
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
