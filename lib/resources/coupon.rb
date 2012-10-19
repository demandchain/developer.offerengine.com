module OfferEngine
  def self.coupon
    {
      :id => "a21c5452d8",
      :expires_at=>nil,
      :created_at=> "Fri Dec 16 19:14:55 UTC 2011",
      :barcode=>"19435755354",
      :state=>"valid",
      :redemption_code=>nil,
      :redeemed_at=>nil,
      :print_url => "http://domain/coupons/a21c5452d8/print"
    }
  end

  def self.full_coupon
    {
      :id => "a21c5452d8",
      :slug => "a21c5452d8",
      :deal_id => "34063ec2",
      :deal_type => "daily-deal",
      :barcode => "19435755354",
      :expires_at => "Tue Jan 10 23:59:59 UTC 2013",
      :created_at => "Fri Dec 16 19:14:55 UTC 2011",
      :state => "valid",
      :redemption_code => nil,
      :redeemed_at => nil,
      :stamp_url => "http://domain/coupons/a21c5452d8/stamp",
    }
  end
end
