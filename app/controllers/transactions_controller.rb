class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                unit_amount: 2000,
                currency: 'usd',
                product_data: {
                  name: 'Stubborn Attachments',
                },
              },
              quantity: 1,
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: 'https://google.com',
          })
        render json: { id: session.id }
    end

    def success

    end
end
