---
title: Saved Deals
---

# Saved Deals
A saved deal let's a user keep a list of deals for future reference.

## Create a saved deal
Creates a saved deal for a user and a deal.

    POST /saved_deals


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

    DELETE https://partner.domain/api/v1/saved_deals/:saved_deal_id

### Response

<%= headers 200 %>
<%= json(:status => "success") %>