module OfferEngine
  def self.new_reseller_card_linked_purchase
    {
        :deal_id => "deal1234",
        :transaction_amount => "3599",
        :transaction_date => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name => "Hank",
        :last_name => "Rearden"
    }
  end

  def self.new_reseller_daily_deal_purchase
    {
        :deal_id => "deal1234",
        :quantity => "2",
        :transaction_date => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name => "Hank",
        :last_name => "Rearden"
    }
  end

  def self.new_reseller_daily_deal_shipped_purchase
    {
        :deal_id => "deal1234",
        :quantity => "2",
        :transaction_date => "2014-06-06T20:30:05Z",
        :transaction_reference => "trans1234",
        :first_name => "Hank",
        :last_name => "Rearden",
        :address_name => "Home",
        :address1 => "123 Any St.",
        :address2 => "Suite 100",
        :postal_code => "12345",
        :city => "Any Town",
        :state => "CA",
        :country => "US"
    }
  end
end
