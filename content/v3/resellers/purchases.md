---
title: Reseller Purchase
---

# Purchases

* [Create a purchase](/v3/resellers/purchases/#create-a-purchase)

Endpoint to create purchases for a third party reseller.  This api is only to
be used if the transaction is completely managed by the third party.


## Create a purchase

    POST https://<username>:<password>@api.offers.deem.com/api/v3/resellers/purchases

### Required Parameters

Which fields are required depends on the type of the deal a purchase is being recorded for.

#### Daily Deal or On Going deals
* deal_id
* quantity
* transaction_reference
* transaction_date
* transaction_amount
* first_name
* last_name

#### Shipped
* deal_id
* quantity
* transaction_reference
* transaction_date
* transaction_amount
* first_name
* last_name
* address_type
* address_one
* postal_code
* city
* state
* country
* telephone

#### Card Linked
* deal_id
* transaction_reference
* transaction_date
* transaction_amount


### Available Fields

The following fields may be included in any purchase request.  All fields sent will be used,
though they may have little to no meaning for some requests.


deal_id
: _String_ The id of the deal that was purchased

transaction_reference
: _String_ Partner generated reference for the transaction

transaction_date (in ISO 8601 format)
: _String_

first_name
: _String_ The first name of the user who made the purchase

last_name
: _String_ The last name of the user who made the purchase

transaction_amount
: _Integer_ The amount of the transaction in cents.  (100 represents 1 dollar.)

quantity
: _Integer_ Number of deals to be purchased.  If this is not specified and is not required, this will default to 1.

address_type
: _String_ Name associated with this shipping address (Home, Work, etc.)

address1
: _String_ First line of the shipping address

address2
: _String_ Second line of the shipping address

postal_code
: _String_ Postal/Zip code of the shipping address

city
: _String_ City name of the shipping address

state
: _String_ Two-character state abbreviation of the shipping address

country
: _String_ Two-character country abbreviation of the shipping address

telephone
: _String_ The telephone number of the user that made the purchase


### Card Linked Request Example

<%= requests("POST https://&lt;username&gt;:&lt;password&gt;@api.offers.deem.com/api/v3/resellers/purchases.json") %>
<%= json(OfferEngine.new_reseller_card_linked_purchase()) %>

### Daily Deal or On Going Request Example

<%= requests("POST https://&lt;username&gt;:&lt;password&gt;@api.offers.deem.com/api/v3/resellers/purchases.json") %>
<%= json(OfferEngine.new_reseller_daily_deal_purchase()) %>

### Daily Deal or On Going Shipped Request Example

<%= requests("POST https://&lt;username&gt;:&lt;password&gt;@api.offers.deem.com/api/v3/resellers/purchases.json") %>
<%= json(OfferEngine.new_reseller_daily_deal_shipped_purchase()) %>

### Response

<%= headers 200 %>
<%= json(OfferEngine.reseller_purchase()) %>

## Error Responses

If there is an error creating the purchase or any required portion an error message will be returned.

### 422

error_type = "cannot_fulfill"
: Not able to fulfill the purchase

error_type = "validations_failed"
: Validation failed, which can be five failure types ("missing_field", "missing", "invalid", "not_owner", and "not_found"). Each type also has the associated resource that caused the error ("purchase") and may also have a field narrowing down the specific attribute if applicable.

## Error Response Example

### Validation errors for purchase only

<%= headers 422 %>
<%= json(OfferEngine.reseller_purchase_error()) %>

### Validation errors for purchase, and shipping address

<%= headers 422 %>
<%= json(OfferEngine.reseller_purchase_error_all()) %>
