---
title: Regional Deals
---

# Regional Deals

## List all region's deals
Returns an array of deal representations.

    GET /regions/:region_id/deals
    GET /regions/:zip/deals
    GET /regions/:city,:state/deals


### Parameters

user_id
: _String_ A user id that will be used to filter deals (e.g. based on user preferences).

### Response

<%= headers 200 %>
<%= json(:status => "success", :deals => [OfferEngine.deal]) %>