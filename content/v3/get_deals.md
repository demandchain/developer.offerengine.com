---
title: Get Deals
---

# Get Deals

The Get Deals call returns a set of applicable deal resources based on the filtering parameters you pass in your request. You can request a broad list of available deals or very specific highly targeted deals to provide to your users.

You must specify in the request the attributes you want returned in the JSON response for each deal. You may specify all available fields or a subset of fields that you need.. You may specify any, or all of the attributes available. See the "Specifying attributes to be returned" for an example and see the "Response" section for a list of all possible values.

Returned results will be sorted in descending order by deal end date. If you would like the results sorted differently, you may also specify the sort order for deals returned within the JSON response. You can find the sort options in the "Specifying sort order" section.

Each deal has a number of attributes you can use to filter the Get Deals request -- the price point, the amount of inventory, the merchant, the deal title, the run date, the location, and so on. You can find all of the possible filtering parameters in the "Specifying filters" section. For more information about the deal resource, see the "Response" section.

If you make this call with no filters, Get Deals returns a list of <i>all</i> "in-flight" (currently active) deals across <i>all</i> geographical regions -- including deals that are sold out and deals that are <i>not</i> sold out. To avoid retrieving sold-out deals, we recommend that you pass <i>filters=sold_out=false</i> when making this call.

## Request

    GET /api/v3/deals

## Specifying attributes to be returned

You provide the attributes to be included in the query string with the key word "fields".
The list of attributes to be returned should be a comma separated list of fields. Some fields (like _images_ include multiple sub-fields that can be returned. For these, you must specify which sub-fields to return inside a set of square brackets [].

    GET https://username:password@api.offers.deem.com/api/v3/deals?fields=id,title,price,region,type,images[small,large]

## Specifying sort order

You specify the sort order in the query string with the key word "sort". Ascending(asc) and Descending(desc) order can be indicated in parentheses.

    GET https://username:password@api.offers.deem.com/api/v3/deals?sort=start_at(desc)&fields=id,title,price,region,type,images[small,large]

## Specifying filters

You specify filtering in the query string with the key word "filter".

    GET https://username:password@api.offers.deem.com/api/v3/deals?filter=region[san-francisco,phoenix],sold_out[false],price>1500&fields=id,title,price,region,type,images[small,large]

As you add a parameter to the filter with a comma(,), it is evaluated with a logical AND operation with any other parameter to filter the results.

### Individual deal filter parameters

### Category parameters

category
: _Optional String_ : Filter deals by category. Deals can be returned in the category "foo" using ?filter=category[foo]. Deals can be returned in multiple categories using ?filter=category[foo,bar].

subcategory
: _Optional String_ : Filter deals by subcategory. Deals can be returned in the subcategory "foo" using ?filter=subcategory[foo]. Deals can be returned in multiple subcategories using ?filter=subcategory[foo,bar].

### Price parameters

price
: _Optional Integer_ : Filter the deal price in cents (i.e., 100 equals one dollar). Can be used in conjunction with "<", ">", "=" and combinations thereof using for instance ?filter=price>=1500. Multiple exact price matches can be selected using ?filter=price[1300,1500].

### Location parameters

region
: _Optional String_ : Filter deals by region_id. Can be used in conjunction with "[]". To select all deals from multiple regions, use ?filter=region[san-francisco,atlanta].

region_city
: _Optional String_ : Filter deals by city within two character state. Should be nested within "[]". Use?filter=region_city[san%20francisco,ca]. To select deals from multiple region cities, nest the selection array within an outer array. Use ?filter=region_city[[san%20francisco,ca],[los%20angeles,ca]].

lat_long
: _Optional String_ : Filter deals by location using latitude, longitude and radius in miles. Use ?filter=lat_long[123.1112,-321.1132,5].

### Inventory parameters

sold_out
: _Optional Boolean_ : Filter deals that are either sold_out or not sold_out. Use ?filter=sold_out[false] to select deals that are not sold_out.

### Deal Option parameters

include_deal_item
: _Optional Boolean_ : Filter deals that do or do not include options. Use ?filter=include_deal_item[false] to select
 deals which do not have options.  Use ?include_deal_item[true] to allow both deals with and without options
 to be returned.

## Response

The response includes the HTTP status of the request along with the associated response data provided in a JSON file.

## Response Attributes

The response JSON file contains a list of deal resources that meet the request filter parameters.

### Status attributes

status
: _String_  State of the request (error) only present when an error has occurred

### Deal attributes

A list of deal resources with all associated deal attributes for each deal in the result set:

id
: _String_ Unique identifier for purchased deal

campaign
: _String_ The name for tracking a group of deals used in a marketing campaign

category
: _String_ Broad deal type

category_id
: _String_ Unique identifier for category the deal is in

cost
: _Integer_ The cost of the deal in cents

description1
: _String_ Primary description of the deal

description2
: _String_ Secondary description of the deal

end_at
: _Date_ The date and time that the deal will no longer be available to purchase (times are in UTC)

expires_at
: _Date_ If set, the date and time that the deal voucher will expire (times are in timezone of deal's region)

expiration_days
: _Integer_ If set, the number of days after which a voucher will expire.

fine_print
: _String_ Specific details and restrictions associated with the deal

fine_print_legalese
: _String_ Legal Specifics details and restrictions associated with the deal (fulfillment_method='printed' only)

fixed_fee
: _Integer_ The fee charged for running the deal in cents (only for card-linked deals)

fulfillment_method
: _String_ How the consumer redeems the deal:
: * redemptioncoded - A purchase grants the customer a code which is provided by a merchant that can be redeemed on the merchant's website.
: * printed - A user pays for and prints out a physical coupon to bring to a store to redeem for a discount on goods or services.
: * shipped - The purchase is shipped to the customer

highlights
: _String_ Additional important details about the deal

images
: _Hash_ A list of deal images in different sizes. Each image is available in the following sizes:

  * large, medium, small, and tiny
  * Each item points to the images URL.

incentive_amount
: _Integer_ A flat amount of discount in cents that a user gets for using this deal (only for card-linked deals)

incentive_percentage
: _Integer_ The percent discount a user gets for using this deal (only for card-linked deals)

instructions
: _String_ Usage details for the deal

locations
: _Array_ The physical locations associated with the deal

max_linkage
: _Integer_ Number of users that can link to deal (only for card-linked deals)

max_per_user
: _Integer_ The maximum quantity available to purchase by a user

max_gift_per_user
: _Integer_ How many gifts each user is allowed to buy

maximum_allowance
: _Integer_ The maximum value of a deal purchase (only for card-linked deals)

merchant_id
: _String_ Unique identifier for the merchant offering the deal

merchant_name
: _String_ Name of the merchant of the deal

min_spend
: _Integer_ The minimum value of a purchase to qualify for the deal (only for card-linked deals)

num_left
: _Integer_ The quantity of units left for purchase

num_qualifying
: _Integer_     Number of qualifying purchases required to trigger redemption (only for card-linked deals)

number_sold
: _Integer_ The quantity of units sold of this deal

percent_fee
: _Integer_ The percent charged for running the deal (only for card-linked deals)

purchase_url
: _String_ The URL for deal purchase web page

redemption_url
: _String_ The URL a purchaser will redeem the coupon/redemption code

region_id
: _String_ Unique identifier for region in which the deal is for sale

region_name
: _String_ Human-readable region name

robotitle
: _String_ The deal title for affiliate feeds

shipping_address_required
: _Boolean_ Flagged if a shipping address is required to purchase this deal

show_url
: _String_ The URL for the deal details web page

sold_out
: _Boolean_ Flagged if the deal has sold out of inventory

start_at
: _Date_ The date and time that the deal was first available to purchase (times are in UTC)

state
: _String_ The current workflow state of the deal:
: * in-flight - The deal is available for purchase. (This is the only state returned by the API)

subcategory
: _String_ More specific deal type

supplier_id
: _String_ Unique identifier for supplier of the deal

tags
: _Array_ An array of the tags associated with this deal

title
: _String_ Title of the purchased deal

type
: _String_ Type of the purchased deal
  Daily Deal:
  The Daily Deal is a prepaid voucher which is in-flight on a partner site for a short period of time.

  On-going:
  A long-running prepaid voucher deal which is in-flight on partner sites for more than 15 days.

  Affiliate:
  A a deal that can be claimed by a consumer for free. The consumer can click the Claim this deal button to obtain a
  coupon code.

  Affiliate deals do not have actual purchases or vouchers associated with them. A user claims an affiliate deal which:

  a) exposes a redeemable code.
  OR
  b) redirects the user to a co-marketed website.

  Card-linked Offers:
  A card-linked offer (CLO) is an offer linked to a payment card. The user links an offer to his or her card without
  having to pay anything. When the user buys the product or service from the qualifying merchant, the offer is applied to the transaction immediately, reducing the card charge, or is applied as a credit to the card.

value
: _Integer_ The value of the deal in cents

sku
: _String_ The SKU (Stock Keeping Unit) for a deal.

deal_items
: _Array of Hashes_ A list of options for the deal.


### Deal Option attributes
The options for a deal which are in the deal_items array will always include the following attributes:

product_name
: _String_ The name of the option (equivalent to title for the deal)

sort_order
: _Integer_ The order of the item in the list.

Options will also include the following columns if the same columns are included for the deal.  Although the column
names are the same, the values in the options are independent of the deal and may be the same or different.

* id
* campaign
* cost
* highlights
* max_per_user
* max_gift_per_user
* num_left
* sold_out
* value
* price
* number_sold
* redemption_url
* purchasable_number
* description1
* description2
* fine_print
* instructions
* images
* sku

### Pagination attributes

next_page
: _String_ The URL for the next page of deals.

## Response Examples

### Filter deals by the "los_angeles" region with two deals returned:

<%= headers 200 %>
<%= json(OfferEngine::V3.deals) %>

### Filter deals by the "restaurants" category with no deals returned:

<%= headers 200 %>
<%= json(OfferEngine::V3.deals_empty) %>

### Filter deals by the "los_angeles" region with one deal with options returned:

<%= headers 200 %>
<%= json(OfferEngine::V3.deal_with_options) %>

## Error Responses

Responses provided for failed requests:

### 400

status = "error"
message = "Bad request syntax"
errors = {"query_string":"fields= isd is not recognised as a valid field for inclusion in this JSON response"}}
: Parameter information provided is invalid.

## Error Response Examples

<%= headers 400 %>
<%= json(OfferEngine::V3.deals_error_no_fields_supplied()) %>

<%= headers 400 %>
<%= json(OfferEngine::V3.deals_error_sorting()) %>
