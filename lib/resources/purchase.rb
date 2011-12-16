require 'resources/deal'
require 'resources/coupon'

module OfferEngine
  PURCHASE = {
    :id => "34063ec2",
    :slug => "34063ec2",
    :purchase_id => "34063ec2",
    :deal_type => "standard",
    :deal_slug => "a-50-for-100-worth-of-dining-1",
    :deal_id => "a-50-for-100-worth-of-dining-1",
    :deal => OfferEngine::SHORT_DEAL,
    :price => 1000,
    :amount => 950,
    :number_bought => 1,
    :payment_state => "charged",
    :fulfillment_state => "fulfilled",
    :created_at => "Fri Dec 16 19:11:15 UTC 2011",
    :user_id => "fce3237b",
    :credit_card_id => "a877875fc3",
    :coupons => [OfferEngine::COUPON],
  }
end
