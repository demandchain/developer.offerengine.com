---
title: User Coupons
---

# User Coupons

## List all user's coupons
Returns an array of coupon representations.

    GET /users/:user_id/coupons


### Parameters

options
: _Hash_ A list of options to customize the response results.

  filter
  : filter the list of coupons to a specific state. value can be one of "valid", "redeemed", "expired"

  count
  : returns the count instead of the list

### Response

<%= headers 200 %>
<%= json(:status => "success", :coupons => [OfferEngine.coupon]) %>