---
title: Purchases
---

# Purchases

## Get a purchase
Returns a serialized representation of the purchase.

    GET /purchases/:purchase_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase) %>

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
: _String_  Id of the deal you are reserving inventory for

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase) %>

## Release a reserved purchase
If you have reserved inventory for a purchase, but the payment processing has failed, use release to indicate release the inventory of the purchase.

    PUT /purchases/:purchase_id/release

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine.purchase) %>
