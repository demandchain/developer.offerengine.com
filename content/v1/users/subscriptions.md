---
title: Subscriptions
---

# Subscriptions

## List all user's subscriptions
Returns an array of subscription representations.

    GET /users/:user_id/subscriptions
    GET /users/:user_email/subscriptions

### Parameters

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscriptions => [OfferEngine.subscription]) %>

## Get a subscription
Returns a serialized representation of the subscription.

    GET /subscriptions/:subscription_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>

## Create a subscription for a user

    POST /users/:user_id/subscriptions

### Parameters

zip
: _Integer_

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>

## Update a subscription

    PUT /subscriptions/:subscription_id

### Parameters

status
: _String_  Can be "active" or "inactive".

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>
