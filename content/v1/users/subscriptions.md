---
title: Subscriptions
---

# Subscriptions

* [List all user's subscriptions](/v1/users/subscriptions/#list-all-users-subscriptions)
* [Get a subscription](/v1/users/subscriptions/#get-a-subscription)
* [Create a subscription](/v1/users/subscriptions/#create-a-subscription)
* [Update a subscription](/v1/users/subscriptions/#update-a-subscription)
* [Update by zip code](/v1/users/subscriptions/#update-by-zipcode)
* [Update by full zip code](/v1/users/subscriptions/#update-by-full-zipcode)
* [Unsubscribe](/v1/users/subscriptions/#unsubscribe)

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

## Create a subscription

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


## Update by zipcode

    PUT /api/v1/users/:user_id/subscriptions/postal_code/:postal_code

### Parameters

    none

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>


## Update by full zipcode
This is very similar to updating by zip code, and infact the -4 digits are ignored

    PUT /api/v1/users/:user_id/subscriptions/postal_code/:full_postal_code

### Parameters

    none

### Response

<%= headers 200 %>
<%= json(:status => "success", :subscription => OfferEngine.subscription) %>


## Unsubscribe
This will unsubscribe from all the users subscriptions

    DELETE /api/v1/users/:user_id/subscriptions

### Parameters

    none

### Response

<%= headers 200 %>
<%= json(:status => "success") %>
