---
title: Get Deals
---

# Get Deals

This api will return a set of applicable deal objects based upon the filtering parameters that are passed in the request. You can request a broad list of available deals or very specific highly targeted deals to provide to your users.

## Request 

	GET /v1/deals?api_key={api_key}

## Request Parameters

Required and optional parameters should be provided as a json file. All parameter fields are optional. Each additional parameter added acts as an <b>AND</b> to further filter the results that will be provided in the response.

### individual deal detail parameters

slug
: _Optional String_ Filter deals by a particular deal slug

id 
: _Optional String_ Filter deals by a particular deal slug

marketplace_slug
: _Optional String_ Filter deals by a particular marketplace deal slug

title
: _Optional String_ Filter deals by title like this parameter

### state parameters

state
: _Optional String_ Filter deals in this workflow state (in-flight, approved, submitted, landed, in-review, rejected, paused, deleted)

show_all
: _Optional Boolean_ Show deals in all wordflow states (true only)

### category parameters

category
: _Optional String_ Filter deals by category like this parameter

subcategory
: _Optional String_ Filter deals by subcategory like this parameter

### merchant parameters

merchant
: _Optional String_ Filter deals by merchant name like this parameter

merchant_name
: _Optional String_ Filter deals by merchant name like this parameter

### price parameters

price_min
: _Optional Integer_ Filter minimum deal price in cents

price_max 
: _Optional Integer_ Filter maximum deal price in cents

### location parameters

region
: _Optional String_ Filter deals by region slug, city/state, IP address, or zip

:region_id
: _Optional String_ Filter deals by region slug, city/state, IP address, or zip

lat_lng
: _Optional String_ Filter deals by location (latitude and longitude are comma separated)

latitude
: _Optional String_ Filter deals by location (require longitude parameter)

longitude
: _Optional String_ Filter deals by location (require latitude parameter)

radius
: _Optional Float_ Filter deals within circular radius around longitude and latitude values 

### user parameters

user_id
: _Optional String_ Filter deals for user (user slug or email) (requires card_links_redeemed == false and region)

user
: _Optional String_ Filter deals for user (user slug or email) (requires card_links_redeemed == false and region)

### source parameters

suppliers 
: _Optional Array_ Filter deals by supplier in the form of partner slugs or comma separated partner slugs

vendors
: _Optional Array_ Filter deals by vendor in the form of partner slugs or comma separated partner slugs

account_manager
: _Optional String_ Filter deals by account manager owner email address 

### inventory parameters
 
num_left
: _Optional Integer_ Filter deals by the quantity of inventory left

sold_out
: _Optional Boolean_ Filter deals not sold out (false only)

exclude_soldout
: _Optional Boolean_ Filter deals that are not sold out (true only)

### scheduling parameters

runs_min
: _Optional Date_ Filter minimum deal run date

runs_max
: _Optional Date_ Filter maximum deal run date

card_links_redeemed
: _Optional Boolean_ Filter deals that are not card linked (false only)

## Request Example

### New user account, new credit card, and a shipping address

<%= requests("GET /v1/deals?api_key=1234567") %>
<%= json(OfferEngine.deals_request()) %>

## Response

The request response will provide a http status of the request along with the associated response data provided as a json file

## Response Attributes

The response json file will contain a list of deal objects meeting the request filter parameters

### status attributes

status
: _String_  State of the request (success or error)

### deal attributes

Will contain a list of deal objects with all associated deal attributes for each deal in result set

id
: _String_ Unique identifier for deal purchased

deal_id
: _String_ Unique identifier for deal purchased

title
: _String_ Title of the deal purchased

type
: _String_ Type of the deal purchased

image_url
: _String_ Relative URL for image associated with the deal purchased

image_url_abs
: _String_ Absolute URL for image associated with the deal purchased

locations
: _Array_ Merchant locations associated with the deal

shipping_address_required
: _Boolean_ Flag if a shipping address is required to purchase this deal

merchant_name
: _String_ Name of the merchant of the deal

region_id
: _String_ Region slug the deal is available in

starting_price
: _Integer_ The original price of the deal in cents

current_price
: _Integer_ The current price of the deal in cents

value
: _Integer_ The value of the deal in cents

number_sold
: _Integer_ The quantity of units sold of the this deal

ended
: _Boolean_ Flag if the deal has ended

start_at
: _Date_ The date and time the deal was first available to purchase

end_at
: _Date_ The date and time the deal will no longer be available to purchase

expires_at
: _Date_ The date and time the deal voucher will expire

state
: _String_ The workflow state the deal is currently in

purchasable_number
: _Integer_ The quantity of units available to sell

num_left
: _Integer_ The quantity of units left for purchase

region_name
: _String_ Human readable region name

soldout
: _Boolean_ Flag if the deal has sold out of inventory

description1
: _String_ Primary description of the deal

description2
: _String_ Secondary description of the deal

fine_print
: _String_ Specific details and restrictions associated with the deal

supplier_id
: _String_ The deal's sourcing supplier's slug

highlights
: _String_ Additional important details about the deal

category
: _String_ Broad deal type

:subcategory
: _String_ More specific deal type

robotitle
: _String_ Deal title for affiliate feeds

show_url
: _String_ Url for the deal details web page

purchase_url
: _String_ Url for deal purchase web page
      
campaign
: _String_ Name for tracking group of deals used in a marketing campaign

max_per_user
: _Integer_ The maximum quantity available to purchase by a user (only for card linked offers)

maximum_allowance
: _Integer_ The maximum value of a purchase that the deal will be attributed to 
(only for card linked offers)

min_spend
: _Integer_ Minimum value of a purchase to qualify for the deal (only for card linked offers)

incentive_amount
: _Integer_ Flat amount discount in cents a user gets for using this deal (only for card linked offers)

incentive_percentage
: _Integer_ Percent discount a user gets for using this deal (only for card linked offers)

fixed_fee
: _Integer_ Fee charged for running the deal in cents (only for card linked offers)

percent_fee
: _Integer_ Percent charged for running the deal (only for card linked offers)

primary_image
: _Hash_ List of deal image in different sizes. Each image is available in sizes: thumb, tiny, xlarge, large, medium. Each of those items have a hash with: dimensions and url.

## Response Example

### filter deals by "san_francisco" region with two deals returned

<%= headers 200 %>
<%= json(OfferEngine.deals) %>

### filter deals by "restaurants" category with no deals returned 

<%= headers 200 %>
<%= json(OfferEngine.deals_empty) %>

## Error Responses

Responses provided for failed requests

### 404

error_type = "find_failed"
: Parameter information provided is invalid


## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>