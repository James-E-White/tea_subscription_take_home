require 'rails_helper'

RSpec.describe "Subscriptions Create Requests" do
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
    expect(Subscription.first).to eq(subscription_1)

    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a(Hash)
   
    expect(data[:data][:attributes]).to have_key(:title)
    expect(data[:data][:attributes]).to have_key(:price)
    expect(data[:data][:attributes]).to have_key(:status)
    expect(data[:data][:attributes]).to have_key(:frequency)
    expect(data[:data][:attributes]).to have_key(:tea_id)
    expect(data[:data][:attributes]).to have_key(:customer_id)
    end

  describe 'error handling' do 
    it 'shows error if info is missing' do 
     customer_1 = Customer.create!(first_name: "Ava", last_name: "White", email: "ava@.email", address: "8675309 dream st")
     tea_1 = Tea.create!(title: "The dutchess", description: "A punch to the mouth", temperature: 195, brew_time: 6)
     subscription_1 = Subscription.create!(title: "Tea Subscription # 1", price: 45.10, status: true, frequency: 30, tea_id: tea_1.id, customer_id: customer_1.id)
     subscription_params = {
      'title': subscription_1.title, 'price': 45.10, 'status': true, 'frequency': 30, 'customer_id': customer_1.id
     }
    headers = { 'CONTENT_TYPE' => 'application/json'}
    
    post '/subscriptions', headers: headers, params: JSON.generate(subscription_params) 
    

    expect(status).to eq(400)
    expect(response.body).to eq("{\"error\":\"Some info missing, please try again\"}")
    end 
  end
end