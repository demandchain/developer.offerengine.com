---
title: Subscriptions
---

# Subscriptions

## Update a subscription

    PUT /subscriptions/:subscription_id


### Parameters

status
: _String_  Can be "active" or "inactive".

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>
