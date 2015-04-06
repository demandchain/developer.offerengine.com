---
title: Region Activities
---

# Warning Deprecated
**This call will be removed in a future release**

# Region Activities

## List all region's activities
Returns an array of activity representations.

    GET /api/v1/regions/:region_id/activity

### Response

<%= headers 200 %>
<%= json(:status => "success", :activity => [OfferEngine.activity]) %>

