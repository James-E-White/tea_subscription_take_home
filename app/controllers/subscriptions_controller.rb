class SubscriptionsController < ApplicationController
  before_action :find_customer 

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.valid?
      subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { error: 'Some info missing, please try again' }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
   else
    render json: { error: 'Unable to subscribe, please try again' }, status: 400
  end
 end

def index
   if @customer #= Customer.find(params[:customer_id])
  render json: SubscriptionSerializer.new(@customer.subscriptions)
    else  
      render json: { error: "customer does not exist" }, status: 400 
    end
  end

  def find_customer
   @customer = Customer.find_by(id: params[:customer_id])
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
  #def subscription_params
  #params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  #end
end
