---
title: Regional Deals
---

# Regional Deals

## List all region's deals
Returns an array of deal representations, ordered by start_at time (earliest first).

If you are using the "city, state" syntax, abbreviations are not accepted.  "St Louis" must be spelled as "Saint Louis".

*Important Note*: There are default filters "in_flight", "current", "not_bg" for backwards compatibility.  Most partners will want to override the filter value with "in_flight".

    GET /regions/:region_id/deals
    GET /regions/:zip/deals
    GET /regions/:city,:state/deals


### Parameters

user_id (optional)
: _String_ A user id that will be used to filter deals (e.g. based on user preferences).

<%= list_parameters :applicable_filters => ["in_flight", "offer", "current", "not_bg"]%>

### Response

<%= headers 200 %>
<%= json(:status => "success", :deals => [OfferEngine.deal]) %>