---
title: Regions
---

# Regions

## List all regions
Returns an array of region representations.

    GET /regions

### Response

<%= headers 200 %>
<%= json(:status => "success", :regions => [OfferEngine.region]) %>
