module OfferEngine
  def self.coupon
    {
        :id              => "a21c5452d8",
        :expires_at      => nil,
        :created_at      => "Fri Dec 16 19:14:55 UTC 2011",
        :qr_code_url     => "http://domain/coupon/qr_code/ab231c9e",
        :qr_code         => "apaosidnqw4tdsdpqi45jf091835ukdfq3-40695.kfmdg-q09i6m'ldfi8nqk6",
        :state           => "valid",
        :redemption_code => nil,
        :redeemed_at     => nil,
        :print_url       => "http://domain/coupons/a21c5452d8/print"
    }
  end

  def self.reseller_coupon
    {
        :id              => "a21c5452d8",
        :expires_at      => nil,
        :created_at      => "Fri Dec 16 19:14:55 UTC 2011",
        :qr_code_url     => "http://domain/coupon/qr_code/ab231c9e",
        :qr_code         => "apaosidnqw4tdsdpqi45jf091835ukdfq3-40695.kfmdg-q09i6m'ldfi8nqk6",
        :state           => "valid",
        :redemption_code => nil,
        :redeemed_at     => nil
    }
  end

  def self.full_coupon
    {
        :id              => "a21c5452d8",
        :slug            => "a21c5452d8",
        :deal_id         => "34063ec2",
        :deal_type       => "daily-deal",
        :barcode         => "19435755354",
        :expires_at      => "Tue Jan 10 23:59:59 UTC 2013",
        :created_at      => "Fri Dec 16 19:14:55 UTC 2011",
        :state           => "valid",
        :redemption_code => nil,
        :redeemed_at     => nil,
        :stamp_url       => "http://domain/coupons/a21c5452d8/stamp",
    }
  end

  def self.reseller_coupon_status
    {
        :coupon          => OfferEngine.reseller_coupon
    }
  end

  def self.coupon_error
    {
      :status            => "error",
      :error_type        => "find_failed",
      :error_msg         => "Failed. not found.",
    }
  end

end
