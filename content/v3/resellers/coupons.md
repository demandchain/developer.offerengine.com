---
title: Reseller Coupons
---

# Reseller Coupons

* [Check the status of a coupon](/v3/resellers/coupons/#check-coupon-status)

## Check coupon status

Endpoint for a third party reseller to check the status of a coupon.

    POST https://<username>:<password>@api.offers.deem.com/api/v3/coupons/:coupon_id

### Response

<%= headers 200 %>
<%= json(OfferEngine.reseller_coupon_status()) %>

## Error Responses

If there is an error in processing the request, an error message will be returned.

### Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.coupon_error()) %>

