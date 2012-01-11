module OfferEngine
  def self.short_deal
    {
      :id => "a-50-for-100-worth-of-dining-1",
      :deal_id => "a-50-for-100-worth-of-dining-1",
      :title => "$50 for $100 worth of Dining",
      :type => "daily-deal",
      :image_url =>  "deals/generic_medium.gif",
      :image_url_abs =>  "http://d2x9dz1etb1m98.cloudfront.net/deals/generic_medium.gif"
    }
  end

  def self.deal
    {
      :id => "my-restaurant",
      :deal_id => "my-restaurant",
      :locations => [],
      :title => "Great Dining",
      :type => "daily-deal",
      :image_url => "deals/generic_medium.gif",
      :image_url_abs =>  "http://d2x9dz1etb1m98.cloudfront.net/deals/generic_medium.gif",
      :shipping_address_required => false,
      :merchant_name => "Morar, Shanahan and Ruecker",
      :region_id => "san-francisco",
      :starting_price => 5000,
      :current_price => 5000,
      :value => 10000,
      :number_sold => 100,
      :ended => true,
      :start_at => "Sun Nov 20 02:35:58 UTC 2011",
      :end_at => "Tue Nov 22 02:35:58 UTC 2011",
      :expires_at => "Tue Nov 29 02:35:58 UTC 2011",
      :state => "in-flight",
      :purchasable_number => 10,
      :num_left => 10,
      :region_name => "San Francisco",
      :soldout => false,
      :description1 => "Blanditiis cupiditate iure possimus ipsam. Vel explicabo aut repudiandae. Ea et aliquid totam enim voluptates et rerum perspiciatis. Placeat voluptates veritatis qui ut et quia. Et perferendis nihil ut.",
      :description2 => "Exercitationem ex consequatur veniam magnam eum aut asperiores dolorum. Blanditiis dicta ut et quo. Expedita facilis impedit deserunt magnam. Voluptatum nostrum et repudiandae ipsam nihil sunt. Delectus qui nesciunt blanditiis omnis in illo nihil voluptatem.",
      :fine_print => "Sapiente nisi beatae fugit. Distinctio omnis suscipit minima expedita. Et qui eos neque beatae. Sit cum ut natus dicta perspiciatis laboriosam molestias corrupti. Molestias quia odio sit.",
      :supplier_id => "sub-partner1",
      :highlights => "Distinctio omnis suscipit minima expedita. Et qui eos neque beatae. Sit cum ut natus dicta perspiciatis laboriosam molestias corrupti. Molestias quia odio sit.",
      :maximum_allowance => nil,
      :incentive_amount => nil,
      :max_per_user => 10,
      :min_spend => nil,
      :incentive_percentage => nil,
      :fixed_fee => nil,
      :percent_fee => nil,
      :category => "category",
      :subcategory => "subcategory",
      :robotitle => "$50 for $100 Great Dining at Kuhn, Goldner and Spencer",
      :show_url => "http://domain/deal/my-restaurant",
      :purchase_url => "http://domain/deal/my-restaurant/get",
      :primary_image => {
        "thumb" => {"dimensions" => "(198x130>)","url" => "http://domain/images/deals/generic640x426.gif"},
        "tiny" =>  {"dimensions" => "(81x56)","url" => "http://domain/images/deals/generic640x426.gif"},
        "xlarge" => {"dimensions" => "(640x640>)","url" => "http://domain/images/deals/generic640x426.gif"},
        "large" => {"dimensions" => "(520x352)","url" => "http://domain/images/deals/generic640x426.gif"},
        "medium" => {"dimensions" => "(390x260)","url" => "http://domain/images/deals/generic640x426.gif"}
      },
      :campaign => "campaign"
    }
  end
end
