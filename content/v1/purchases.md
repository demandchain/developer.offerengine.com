---
title: Purchases
---

# Purchases

## Get a purchase
Returns a serialized representation of the purchase.

    GET /purchases/:purchase

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine::PURCHASE) %>



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
<%= json(:status => "success", :purchase_id => "34063ec2") %>


## Update a purchase

    PUT /purchases/:purchase


### Parameters

email
: _String_

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_

first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchase => OfferEngine::USER) %>
