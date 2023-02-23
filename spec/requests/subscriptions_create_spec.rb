require 'rails_helper'

describe "Subscriptions Create Requests" do
  it "adds a new subscription to the customer" do
    
    customer_1 = Customer.create!(first_name: "Ava", last_name: "White", email: "ava@.email", address: "8675309 dream st")
    tea_1 = Tea.create!(title: "The dutchess", description: "A punch to the mouth", temperature: 195, brew_time: 6)
    subscription_1 = Subscription.create!(title: "Tea Subscription # 1", price: 45.10, status: true, frequency: 30, tea_id: tea_1.id, customer_id: customer_1.id)
    subscription_params = {
      'title': subscription_1.title, 'price': 45.10, 'status': true, 'frequency': 30, 'tea_id': tea_1.id, 'customer_id': customer_1.id
     }
    headers = { 'CONTENT_TYPE' => 'application/json'}
    
    post '/subscriptions', headers: headers, params: JSON.generate(subscription_params) 

    expect(response).to be_successful
    expect(Subscription.all.count).to eq 1
    #binding.pry
    body = JSON.parse response.request.params
   
    end
  
end