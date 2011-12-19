---
title: User Saved Deals
---

# User Saved Deals

## List all user's saved deals
Returns an array of saved deal representations.

    GET /users/:user_id/saved_deals


### Parameters

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :saved_deals => [OfferEngine.saved_deal]) %>