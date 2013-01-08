require 'resources/deal'
require 'resources/coupon'
require 'resources/credit_card'
require 'resources/user'
require 'resources/deal'

$purchase_id = "34063ec2"
$api_key = "1234567"

module OfferEngine
  def self.purchase(opts = {})
    {
      :id => $purchase_id,
      :purchase_id => $purchase_id,
      :deal_type => OfferEngine.deal[:type],
      :deal_id => OfferEngine.deal[:id],
      :price => OfferEngine.deal[:current_price],
      :amount => OfferEngine.deal[:current_price] * OfferEngine.deal[:number_sold],
      :number_bought => OfferEngine.deal[:number_sold],
      :payment_state => "charged",
      :fulfillment_state => "fulfilled",
      :created_at => "Fri Dec 16 19:11:15 UTC 2011",
      :user_id => OfferEngine::USER[:id],
      :credit_card_id => OfferEngine.credit_card[:id],
      :deal => OfferEngine.short_deal,
      :coupons => [OfferEngine.coupon],
    }.merge(opts)
  end

  def self.full_purchase(opts = {})
    {
      :status => "success",
      :purchase => OfferEngine.purchase
    }.merge(opts)
  end

  def self.full_purchase_request
    {
      :deal_id => OfferEngine.short_deal[:id],
      :quantity => 1,
      :user_id => OfferEngine::USER[:id], 
      :credit_card_id => OfferEngine.credit_card[:id],
    }
  end

  def self.full_purchase_request_new
    {
      :deal_id => OfferEngine.short_deal[:id], 
      :quantity => 1,
      :user => OfferEngine.new_user, 
      :credit_card => OfferEngine.credit_card_request,
      :shipping_address => OfferEngine.shipping_address,
    }
  end

  def self.full_purchase_error_all
    {
      :status => "error",
      :error_type => "validation_failed",
      :error_msg => "validation failed",
      :errors => [
        {
          :type => "missing_field",
          :message => "is missing",
          :field => "email",
          :resource => "user"
        },
        {
          :type => "missing",
          :message => "missing credit card info",
          :resource => "credit_card"
        },
        {
          :type => "invalid",
          :message => "cannot purchase that many",
          :field => "quantity",
          :resource => "purchase"
        },
        {
          :type => "not_found",
          :message => "doesn not exist",
          :resource => "shipping_address"
        }
      ],
    }
  end
  def self.full_purchase_error
    {
      :status => "error",
      :error_type => "validation_failed",
      :error_msg => "validation failed",
      :user_id => OfferEngine::USER[:id],
      :credit_card_id => OfferEngine.credit_card[:id],
      :errors => [
        {
          :type => "invalid",
          :message => "cannot purchase that many",
          :field => "quantity",
          :resource => "purchase",
        },
      ],
    }
  end
end