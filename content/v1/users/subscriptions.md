---
title: Subscriptions
---

# Subscriptions

* [List all user's subscriptions](/v1/users/subscriptions/#list-all-users-subscriptions)
* [Get a subscription](/v1/users/subscriptions/#get-a-subscription)
* [Create a subscription](/v1/users/subscriptions/#create-a-subscription)
* [Update a subscription](/v1/users/subscriptions/#update-a-subscription)

## List all user's subscriptions
Returns an array of subscription representations.

    GET /api/v1/users/:user_id/subscriptions
    GET /api/v1/users/:user_email/subscriptions

### Parameters

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscriptions => [OfferEngine.subscription]) %>

## Get a subscription
Returns a serialized representation of the subscription.

    GET /api/v1/subscriptions/:subscription_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>

## Create a subscription

    POST /api/v1/users/:user_id/subscriptions

### Parameters

zip
: _Integer_

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>

## Update a subscription

    PUT /api/v1/subscriptions/:subscription_id

### Parameters

status
: _String_  Can be "active" or "inactive".

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>
