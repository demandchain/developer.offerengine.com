---
title: User Purchases
---

# User Purchases

## List all user's purchases
Returns an array of purchase representations.

    GET /users/:user_id/purchases


### Parameters

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :purchases => [OfferEngine.purchase]) %>