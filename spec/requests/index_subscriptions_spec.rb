require 'rails_helper'

RSpec.describe "Subscriptions Index" do
  it "it shows all the subscriptions for a customer" do
    customer = Customer.create!(first_name: "Ava", last_name: "White", email: "ava@.email", address: "8675309 dream st")
    tea_1 = Tea.create!(title: "The dutchess", description: "A punch to the mouth", temperature: 195, brew_time: 6)
    tea_2 = Tea.create!(title: "Earl of the grey", description: "A refined palette", temperature: 185, brew_time: 5)
    tea_3 = Tea.create!(title: "A fungi", description: "A punch to the mouth", temperature: 190, brew_time: 4)
    
    
   
     subscription_1 = Subscription.create!(title: "Tea Subscription # 1", price: 45.10, status: true, frequency: 30, tea_id: tea_1.id, customer_id: customer.id)
     subscription_2 = Subscription.create!(title: "Tea Subscription # 2", price: 15.90, status: true, frequency: 20, tea_id: tea_2.id, customer_id: customer.id)
     subscription_3 = Subscription.create!(title: "Tea Subscription # 3", price: 35.50, status: true, frequency: 30, tea_id: tea_3.id, customer_id: customer.id)
     headers = { 'CONTENT_TYPE' => 'application/json'}


    get "/customers/#{customer.id}/subscriptions"

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(customer.subscriptions).to eq([subscription_1, subscription_2, subscription_3])
    expect(response).to be_successful
    expect(data).to be_a(Hash)
  
    end

    it 'sad path, cant get subscriptions for customer, customer doesnt exist' do 
      non_existent_customer_id = 100
      get "/customers/#{non_existent_customer_id}/subscriptions"

      parsed_subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status 400
      expect(parsed_subscription[:error]).to eq("customer does not exist")
    end
  
end