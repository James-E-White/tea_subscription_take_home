require 'rails_helper'

RSpec.describe "Subscriptions Index" do
  it "it shows all the subscriptions for a customer" do
    customer_1 = Customer.create!(first_name: "Ava", last_name: "White", email: "ava@.email", address: "8675309 dream st")
    tea_1 = Tea.create!(title: "The dutchess", description: "A punch to the mouth", temperature: 195, brew_time: 6)
    tea_2 = Tea.create!(title: "Earl of the grey", description: "A refined palette", temperature: 185, brew_time: 5)
    tea_3 = Tea.create!(title: "A fungi", description: "A punch to the mouth", temperature: 190, brew_time: 4)
    
    
   
     subscription_1 = Subscription.create!(title: "Tea Subscription # 1", price: 45.10, status: true, frequency: 30, tea_id: tea_1.id, customer_id: customer_1.id)
     subscription_2 = Subscription.create!(title: "Tea Subscription # 2", price: 15.90, status: true, frequency: 20, tea_id: tea_2.id, customer_id: customer_1.id)
     subscription_3 = Subscription.create!(title: "Tea Subscription # 3", price: 35.50, status: true, frequency: 30, tea_id: tea_3.id, customer_id: customer_1.id)
     headers = { 'CONTENT_TYPE' => 'application/json'}

    customer_info = {
      'customer_id': customer_1.id
    }
     get "/customers/#{customer_1.id}/subscriptions", headers: headers, params: JSON.generate(customer_info) 
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(customer_1.subscriptions).to eq([subscription_1, subscription_2, subscription_3])
    expect(response).to be_successful
    expect(data).to be_a(Hash)
  
   
   
  
    end
end