class CustomersController < ApplicationController
 def create
    new_customer = Customer.create!(customer_params)
    render json: CustomerSerializer.new(customer)
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end