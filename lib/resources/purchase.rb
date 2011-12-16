require 'resources/deal'
require 'resources/coupon'

module OfferEngine
  def self.purchase(opts = {})
    {
      :id => "34063ec2",
      :slug => "34063ec2",
      :purchase_id => "34063ec2",
      :deal_type => "standard",
      :deal_slug => OfferEngine::SHORT_DEAL[:id],
      :deal_id => OfferEngine::SHORT_DEAL[:id],
      :price => 1000,
      :amount => 950,
      :number_bought => 1,
      :payment_state => "charged",
      :fulfillment_state => "fulfilled",
      :created_at => "Fri Dec 16 19:11:15 UTC 2011",
      :user_id => "fce3237b",
      :credit_card_id => "a877875fc3",
      :deal => OfferEngine::SHORT_DEAL,
      :coupons => [OfferEngine.coupon],
    }.merge(opts)
  end
end
