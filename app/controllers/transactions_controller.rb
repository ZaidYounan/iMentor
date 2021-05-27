class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                unit_amount: 500,
                currency: 'usd',
                product_data: {
                  name: 'Donate to Mentor',
                },
              },
              quantity: 1,
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: index_url,
          })
        render json: { id: session.id }
    end

    def success

    end
end
