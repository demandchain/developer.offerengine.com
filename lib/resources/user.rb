module OfferEngine
  USER = {
    id:         "ABC123",
    firstname:  "deal",
    lastname:   "seeker",
    image_url:  "http://graph.facebook.com/508354830/picture?type=large",
    points:     100,
    token:      "partner_provided"
  }

  FULL_USER = USER.merge(
    about:        "I want more deals!",
    credits:      0,
    credit_cards: {
      todo: "PLEASE"
    },
    member_since: "12/25/2011",
    birthday:     "12/25/1980",
    zip:          "94110",
    gender:       "male",
    shipping_addresses: {
      todo: "PLEASE"
    }
  )

  def self.new_user 
    {
      :email => "help@developer.offerengine.com",
      :password => "pass123",
      :password_confirmation => "pass123",
      :first_name => "Hank",
      :last_name => "Rearden",
    }
  end

  def self.shipping_address
    {
      :address_one => "501 Howard St",
      :address_two => "#2000",
      :postal_code => "94105",
      :city => "San Francisco",
      :state => "CA",
      :country => "US",
    }
  end
end
