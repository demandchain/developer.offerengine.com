---
title: Reseller Purchase
---

# Purchases

* [Create a purchase](/v3/resellers/purchases/#create-a-purchase)

Endpoint to create purchases for a third party reseller.  This api is only to
be used if the transaction is completely managed by the third party.


## Create a purchase

    POST /resellers/purchases

### Parameters

#### Required

deal_id
: _String_ The id of the deal that was purchased

transaction_reference
: _String_ Partner generated reference for the transaction

transaction_date (in ISO 8601 format)
: _String_

#### Optional

first_name
: _String_

last_name
: _String_

#### Required for Card Linked

transaction_amount (in cents)
: _Integer_

#### Required for Daily Deal and On Going

quantity
: _Integer_ Number of deals to be purchased

#### Required for Shipped fulfillment method

address_name
: _String_ Name associated with this shipping address (Home, Work, etc.)

address1
: _String_ First line

address2 (optional)
: _String_ Second line

postal_code
: _String_ Postal/Zip code

city
: _String_ City name

state
: _String_ Two-character state abbreviation

country
: _String_ Two-character country abbreviation


### Reseller purchases Request Example

<%= requests("POST /resellers/purchases.json?api_key={api_key}") %>
<%= json(OfferEngine.new_reseller_card_linked_purchase()) %>

### Daily Deal or On Going Request Example

<%= requests("POST /resellers/purchases.json?api_key={api_key}") %>
<%= json(OfferEngine.new_reseller_daily_deal_purchase()) %>

### Daily Deal or On Going Shipped Request Example

<%= requests("POST /resellers/purchases.json?api_key={api_key}") %>
<%= json(OfferEngine.new_reseller_daily_deal_shipped_purchase()) %>

### Response

<%= headers 200 %>
<%= json(OfferEngine.reseller_purchase()) %>

## Error Responses

If there is an error creating the purchase or any required portion an error message will be returned.

### 422

error_type = "cannot_fufill"
: Not able to fulfill the purchase

error_type = "validations_failed"
: Validation failed, which can be five failure types ("missing_field", "missing", "invalid", "not_owner", and "not_found"). Each type also has the associated resource that caused the error ("user", "purchase", "shipping address") and may also have a field narrowing down the specific attribute if applicable.


## Error Response Example

### Validation errors for purchase only

<%= headers 422 %>
<%= json(OfferEngine.reseller_purchase_error()) %>

### Validation errors for purchase, and shipping address

<%= headers 422 %>
<%= json(OfferEngine.reseller_purchase_error_all()) %>