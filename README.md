# Tea Subscription Service

A Rails API for a Tea Subscription Service based on [this project](https://mod4.turing.edu/projects/take_home/take_home_be)




## Architecture and Design

<p> 
<img src=https://user-images.githubusercontent.com/108167041/221061618-e9fd2d27-6c25-49d7-86dd-453dc92a7633.png />

  
</p>


## Subscription End Points:

### View all of a given Customers Subscriptions
Returns all of the subscriptions of a given Customer.

`GET  /customers/:customer_id/subscriptions` 

<b>Example Input:</b>

`GET http://localhost:3000/customers/1/subscriptions`

<b>Example Output:</b>



### Create Subscription
Creates a Subscription with a customer and a specific tea

`POST /subscriptions` 

<b>Example Input:</b>

`POST http://localhost:3000/subscriptions?title=Tea Subscription #2&price=45.99&status=true&frequency=15&tea_id=2&customer_id=2`



### Update Subscription
Lets you update a subscription, specifically if the status is true or false (active or inactive)

`PATCH  /subscriptions` 

<b>Example Input:</b>

`PATCH http://localhost:3000/subscriptions/?status=true`

<b>Example Output:</b>


##
## Local Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Versions

- Ruby 2.7.4

- Rails 6.0.6.1
