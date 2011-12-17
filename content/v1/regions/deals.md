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

user_id (optional)
: _String_ A user id that will be used to filter deals (e.g. based on user preferences).

options
: _Hash_ A list of options to customize the response results.

  filter
  : filter the list of deals to a specific types. e.g. "daily-deal"

  count
  : returns the count instead of the list

  limit
  : limit the result set

### Response

<%= headers 200 %>
<%= json(:status => "success", :deals => [OfferEngine.deal]) %>