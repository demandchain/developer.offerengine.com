---
title: Purchases
---

# Purchases

* [Get a purchase](/v1/purchases/#get-a-purchase)
* [Create a purchase](/v1/purchases/#create-a-purchase)
* [Reserve a purchase](/v1/purchases/#reserve-a-purchase)
* [Claim a purchase](/v1/purchases/#claim-a-purchase)
* [Release a reserved purchase](/v1/purchases/#release-a-reserved-purchase)

## Get a purchase

To get a particular purchase object

This operation returns a representation of a specific purchase transaction and associated information.

### Request

    GET /purchases/<purchase_id>?api_key=<api_key>

### Parameters

None

### Request Example

<%= requests("GET /purchases/34063ec2.json?api_key=1234567") %>

### Response

### Parameters

status
: _String_  State of this purchase ("success" or error type)

purchase_id
: _String_  Unique identifier for this purchase

deal_id
: _String_  Unique identifier for deal purchased

user_id
: _String_  Unique identifier for purchasing user

credit_card_id
: _String_  Unique identifier for credit card used to make this purchase

#### coupons
id
: _String_  Unique identifier for this purchase voucher

slug
: _String_  Unique identifier for this purchase voucher

deal_id
: _String_  Unique identifier for deal purchased

deal_type
: _String_  Type of deal purchased (<possible results>)

barcode
: _String_  Unique barcode used for purchase redemption

redemption_code
: _String_  Unique code used for purchase redemption

expires_at
: _String_  Date and time of purchase voucher expiration

created_at
: _String_  Date and time purchase was made

state
: _String_  State of the purchase (<possible results>)

redeemed_at
: _Optional String_  Date and time when purchase voucher was redeemed

### Response Example
<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase) %>

## Create a purchase

To create a purchase for an existing user with a stored credit card

This operation will execute a purchase transaction for an existing user that already has a stored credit card

    POST /purchases

### Parameters
deal_id
: _String_  Id of the deal you are purchasing inventory for

quantity
: _Integer_ The number of deals you are purchasing for this purchase

user_id
: _String_  Id of the user who is making the purchase

credit_card_id
: _String_  Id of the credit card you are purchasing inventory for

expected_price_per_unit
: _Integer_ The expected price

session_id (optional)
: _String_ The session id that is associated to an affiliate

### Response
<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:coupons => nil)) %>

## Reserve a purchase
Temporarily (5 minutes) reserve inventory for a purchase in order to process payment transactions. If the transaction succeeds, you would perform a checkout; otherwise, you would return the inventory.

    POST /purchases/reserve

### Parameters

deal_id
: _String_  Id of the deal you are reserving inventory for

num_bought
: _Integer_ The number of deals you are reserving for this purchase

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:fulfillment_state => "reserved", :payment_state => "pending", :coupons => [], :credit_card_id => nil, :user_id => nil)) %>

## Claim a purchase
After inventory has been reserved for a purchase and payment processing was successful, you would call claim with your reservation token (the response from the reserve call). This will create a purchase record from your reservation if it is valid. If the reservation is invalid or expired, we will still attempt to create a purchase record however you will not be guaranteed success as the deal might be sold out.

    PUT /purchases/:purchase_id/claim

### Parameters

user_id
: _String_  Id of the user you are reserving inventory for

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:credit_card_id => nil)) %>

## Release a reserved purchase
If you have reserved inventory for a purchase, but the payment processing has failed, use release to indicate release the inventory of the purchase.

    PUT /purchases/:purchase_id/release

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:fulfillment_state => "released", :payment_state => "pending", :coupons => [], :credit_card_id => nil, :user_id => nil)) %>
