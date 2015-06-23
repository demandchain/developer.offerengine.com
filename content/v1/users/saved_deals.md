---
title: User Saved Deals
---

# User Saved Deals

* [List all user's saved deals](/v1/users/saved_deals/#list-all-users-saved-deals)
* [Create a saved deal](/v1/users/saved_deals/#create-a-saved-deal)
* [Delete a saved deal](/v1/users/saved_deals/#delete-a-saved-deal)

A saved deal let's a user keep a list of deals for future reference.

## List all user's saved deals
Returns an array of saved deal representations.

    GET /api/v1/users/:user_id/saved_deals


### Parameters

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :saved_deals => [OfferEngine.saved_deal]) %>

## Create a saved deal
Creates a saved deal for a user and a deal.

    POST /api/v1/saved_deals

### Parameters

deal_id
: _String_  Id of the deal

user_id
: _String_  Id of the user

### Response

<%= headers 200 %>
<%= json(:status => "success", :saved_deal => OfferEngine.saved_deal) %>

## Delete a saved deal
Deletes a saved deal.

    DELETE /api/v1/saved_deals/:saved_deal_id

### Response

<%= headers 200 %>
<%= json(:status => "success") %>
