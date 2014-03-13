module OfferEngine
  def self.new_reseller_card_linked_purchase
    {
        :deal_id               => "deal1234",
        :transaction_amount    => "3599",
        :transaction_date      => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name            => "Hank",
        :last_name             => "Rearden"
    }
  end

  def self.new_reseller_daily_deal_purchase
    {
        :deal_id               => "deal1234",
        :quantity              => "2",
        :transaction_amount    => "3599",
        :transaction_date      => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name            => "Hank",
        :last_name             => "Rearden"
    }
  end

  def self.new_reseller_daily_deal_shipped_purchase
    {
        :deal_id               => "deal1234",
        :quantity              => "2",
        :transaction_amount    => "3599",
        :transaction_date      => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name            => "Hank",
        :last_name             => "Rearden",
        :address_type          => "Home",
        :address1              => "123 Any St.",
        :address2              => "Suite 100",
        :postal_code           => "12345",
        :city                  => "Any Town",
        :state                 => "CA",
        :country               => "US",
        :telephone             => "312-555-1212"
    }
  end

  $reseller_purchase_id = "af063ec2"

  def self.reseller_purchase
    {
        id:                    $reseller_purchase_id,
        transaction_reference: "client_ref_id",
        amount:                OfferEngine.deal[:current_price] * OfferEngine.deal[:number_sold],
        number_bought:         OfferEngine.deal[:number_sold],
        fulfillment_state:     "fulfilled",
        created_at:            "Fri Dec 16 19:11:15 UTC 2011",
        deal:                  {
            id:            OfferEngine.deal[:id],
            title:         OfferEngine.deal[:title],
            image_url_abs: OfferEngine.deal[:primary_image][:large][:url]
        },
        :coupons               => [OfferEngine.reseller_coupon]
    }
  end

  def self.reseller_purchase_error_all
    {
        :status     => "error",
        :error_type => "validation_failed",
        :error_msg  => "validation failed",
        :errors     => [
            {
                :type     => "not_found",
                :message  => "deal not found",
                :resource => "deal"
            },
            {
                :type     => "missing_field",
                :message  => "address_type is required",
                :field    => "address_type",
                :resource => "shipping_address"
            }
        ],
    }
  end

  def self.reseller_purchase_error
    {
        :status         => "error",
        :error_type     => "validation_failed",
        :error_msg      => "validation failed",
        :user_id        => OfferEngine::USER[:id],
        :errors         => [
            {
                :type     => "not_found",
                :message  => "deal not found",
                :resource => "deal"
            },
        ],
    }
  end
end
