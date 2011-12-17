---
title: User Saved Deals
---

# User Saved Deals

## List all user's saved deals
Returns an array of saved deal representations.

    GET /users/:user_id/saved_deals


### Parameters

options
: _Hash_ A list of options to customize the response results.
  count
  : returns the count instead of the list

### Response

<%= headers 200 %>
<%= json(:status => "success", :saved_deals => [OfferEngine.saved_deal]) %>