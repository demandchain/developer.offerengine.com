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

This request retrieves a specific purchase object. It returns a representation of a specific purchase transaction and associated information.

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

qrcode_url
: _String_  URL for the qrcode image associated with the coupon

qrcode_base64
: _String_  Base64 encoded qrcode image associated with the coupon

redeemed_at
: _Optional String_  Date and time when purchase voucher was redeemed

### Response Example
<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase) %>

## Create a purchase

This request creates a purchase for an existing user with a stored payment card. This operation will execute a purchase transaction for an existing user that already has a stored payment card.

    POST /purchases

### Parameters
deal_id
: _String_  ID of the deal for which you are purchasing inventory

quantity
: _Integer_ The number of deals you are purchasing for this purchase

user_id
: _String_  ID of the user who is making the purchase

credit_card_id
: _String_  ID of the payment card for which you are purchasing inventory

expected_price_per_unit
: _Integer_ The expected price

session_id (optional)
: _String_ The session ID that is associated with an affiliate

### Response
<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:coupons => nil)) %>

## Reserve a purchase
Temporarily reserve inventory (for five minutes) for a purchase in order to process payment transactions. If the transaction succeeds, you would perform a checkout; otherwise, you would return the inventory.

    POST /purchases/reserve

### Parameters

deal_id
: _String_  ID of the deal for which you are reserving inventory

num_bought
: _Integer_ The number of deals you are reserving for this purchase

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:fulfillment_state => "reserved", :payment_state => "pending", :coupons => [], :credit_card_id => nil, :user_id => nil)) %>

## Claim a purchase
After inventory has been reserved for a purchase and payment processing is successful, you would use this requent with your reservation token (the response from the reserve call) to create a purchase record from your reservation -- if the reservation is valid. If the reservation is invalid or expired, we will still attempt to create a purchase record; however, succes is not guaranteed because the deal might be sold out.

    PUT /purchases/:purchase_id/claim

### Parameters

user_id
: _String_  ID of the user for which you are reserving inventory

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:credit_card_id => nil)) %>

## Release a reserved purchase
If you have reserved inventory for a purchase but the payment processing failed, use this request to release the inventory of the purchase.

    PUT /purchases/:purchase_id/release

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase.merge(:fulfillment_state => "released", :payment_state => "pending", :coupons => [], :credit_card_id => nil, :user_id => nil)) %>
