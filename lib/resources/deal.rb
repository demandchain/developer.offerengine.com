module OfferEngine
  $longitude = 37.7750
  $latitude = 122.4183
  $radius = 10.0

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
  def self.deal2
    {
      :id => "your-restaurant",
      :deal_id => "your-restaurant",
      :locations => [],
      :title => "Fine Dining",
      :type => "daily-deal",
      :image_url => "deals/generic_medium.gif",
      :image_url_abs =>  "http://d89fsdf89sdf8.cloudfront.net/deals/generic_medium.gif",
      :shipping_address_required => false,
      :merchant_name => "Some Guys",
      :region_id => "san-francisco",
      :starting_price => 10000,
      :current_price => 10000,
      :value => 20000,
      :number_sold => 1,
      :ended => true,
      :start_at => "Sun Nov 21 02:35:58 UTC 2011",
      :end_at => "Tue Nov 23 02:35:58 UTC 2011",
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
      :robotitle => "$100 for $200 Fine Dining at Some Guys",
      :show_url => "http://domain/deal/your-restaurant",
      :purchase_url => "http://domain/deal/your-restaurant/get",
      :primary_image => {
        "thumb" => {"dimensions" => "(198x130>)","url" => "http://domain/images/deals/generic640x425.gif"},
        "tiny" =>  {"dimensions" => "(81x56)","url" => "http://domain/images/deals/generic640x425.gif"},
        "xlarge" => {"dimensions" => "(640x640>)","url" => "http://domain/images/deals/generic640x425.gif"},
        "large" => {"dimensions" => "(520x352)","url" => "http://domain/images/deals/generic640x425.gif"},
        "medium" => {"dimensions" => "(390x260)","url" => "http://domain/images/deals/generic640x425.gif"}
      },
      :campaign => "campaign"
    }
  end
  def self.deals_request
    {
      :region => self.deal[:region_id],
      :exclude_soldout => "true",
    }
  end
  def self.deals_locate_request
    {
      :latitude => $latitude,
      :longitude => $longitude,
      :radius => $radius,
    }
  end
  def self.deals
    {
      :status => "success",
      :deals => [self.deal, self.deal2,]
    }
  end
  def self.deal_success
    {
      :status => "success",
      :deals => [self.deal]
    }
  end
  def self.deals_empty
    {
      :status => "success",
      :deals => []
    }
  end
  def self.deals_error
    {
      :status => "error",
      :error_type => "find_failed",
      :error_msg => "Unable to find",
    }
  end
  def self.deal_resource
    "### status attributes

status
: _String_  State of the request (success or error)

### Deal attributes

A list of deal resources with all associated deal attributes for each deal in the result set:

id
: _String_ Unique identifier for purchased deal 

deal_id
: _String_ Unique identifier for purchased deal 

title
: _String_ Title of the purchased deal 

type
: _String_ Type of the purchased deal 

image_url
: _String_ Relative URL for an image associated with the purchased deal 

image_url_abs
: _String_ Absolute URL for an image associated with the purchased deal 

locations
: _Array_ Merchant locations associated with the deal

shipping_address_required
: _Boolean_ Flagged if a shipping address is required to purchase this deal

merchant_name
: _String_ Name of the merchant of the deal

region_id
: _String_ Region (region slug) in which the deal is available 

starting_price
: _Integer_ The original price of the deal in cents

current_price
: _Integer_ The current price of the deal in cents

value
: _Integer_ The value of the deal in cents

number_sold
: _Integer_ The quantity of units sold of this deal

ended
: _Boolean_ Flagged if the deal has ended

start_at
: _Date_ The date and time that the deal was first available to purchase

end_at
: _Date_ The date and time that the deal will no longer be available to purchase

expires_at
: _Date_ The date and time that the deal voucher will expire

state
: _String_ The current workflow state of the deal:

: * submitted - Base deal data has been entered and the deal is not available for purchase.
: * in-review - The deal needs approval to continue in the workflow and is not available for purchase.
: * rejected - The deal failed approval and is not available for purchase.
: * approved - The content is complete and the deal is ready to be run, but not yet available for purchase.
: * in-flight - The deal is available for purchase.
: * paused - The deal's sale is halted and the deal is not currently available for purchase.
: * landed - The run window has passed and the deal is no longer available for purchase.
: * deleted - The deal has been removed.<br><br>

purchasable_number
: _Integer_ The quantity of units available to sell

num_left
: _Integer_ The quantity of units left for purchase

region_name
: _String_ Human-readable region name

soldout
: _Boolean_ Flagged if the deal has sold out of inventory

description1
: _String_ Primary description of the deal

description2
: _String_ Secondary description of the deal

fine_print
: _String_ Specific details and restrictions associated with the deal

supplier_id
: _String_ The slug for the deal's sourcing supplier

highlights
: _String_ Additional important details about the deal

category
: _String_ Broad deal type

:subcategory
: _String_ More specific deal type

robotitle
: _String_ The deal title for affiliate feeds

show_url
: _String_ The URL for the deal details web page

purchase_url
: _String_ The URL for deal purchase web page
      
campaign
: _String_ The name for tracking a group of deals used in a marketing campaign

max_per_user
: _Integer_ The maximum quantity available to purchase by a user (only for card-linked deals)

maximum_allowance
: _Integer_ The maximum value of a deal purchase (only for card-linked deals)

min_spend
: _Integer_ The minimum value of a purchase to qualify for the deal (only for card-linked deals)

incentive_amount
: _Integer_ A flat amount of discount in cents that a user gets for using this deal (only for card-linked deals)

incentive_percentage
: _Integer_ The percent discount a user gets for using this deal (only for card-linked deals)

fixed_fee
: _Integer_ The fee charged for running the deal in cents (only for card-linked deals)

percent_fee
: _Integer_ The percent charged for running the deal (only for card-linked deals)

primary_image
: _Hash_ A list of deal images in different sizes. Each image is available in the following sizes: thumb, tiny, xlarge, large, and medium. Each item has a hash with the dimensions and URL."

  end
end
