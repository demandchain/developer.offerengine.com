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

## Redeem user's coupon
Marks a coupon as redeemed.

    PUT /users/:user_id/coupons/:coupon_id/redeem
    PUT /coupons/:coupon_id/redeem

### Response

<%= headers 200 %>
<%= json(:status => "success", :coupon => OfferEngine.coupon.merge(:state => "redeemed", :redeemed_at => "Fri Dec 16 21:14:55 UTC 2011")) %>
