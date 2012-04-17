---
title: Regions
---

# Regions

* [Get a region](/v1/regions/#get-a-region)
* [List all regions](/v1/regions/#list-all-regions)


## Get a region

    GET /api/v1/regions/:region_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :region => OfferEngine.region) %>


## List all regions
Returns an array of region representations.

    GET /api/v1/regions

### Response

<%= headers 200 %>
<%= json(:status => "success", :regions => [OfferEngine.region]) %>
