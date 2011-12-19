---
title: User Coupons
---

# User Coupons

## List all user's coupons
Returns an array of coupon representations.

    GET /users/:user_id/coupons


### Parameters

<%= list_parameters :applicable_filters => ["valid", "redeemed", "expired"] %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :coupons => [OfferEngine.coupon]) %>