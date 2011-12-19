---
title: Region Activities
---

# Region Activities

## List all region's activities
Returns an array of activity representations.

    GET /regions/:region_id/activity

### Response

<%= headers 200 %>
<%= json(:status => "success", :activity => [OfferEngine.activity]) %>

