---
title: Deals
---

# Deals


## Get a deal

    GET /deals/:deal_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>

## Get deals near a latitude and longitude

    GET /deals/locate

### Parameters

latitude
: _Float_ latitude coordinate for origin of search

longitude
: _Float_ longitude coordinate for origin of search

radius
: _float_ distance in miles from origin

### Response

<%= headers 200 %>
<%= json(:status => "success", :deals => [OfferEngine.deal]) %>

## External approve a deal
Mark the deal as externally approved. The deal must be pending external approval.

    PUT /deals/:deal_id/external_approve

### Parameters

reason (optional)
: _String_  reason for approving.

### Response

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>


## External reject a deal
Mark the deal as externally rejected. The deal must be pending external approval.

    PUT /deals/:deal_id/external_reject

### Parameters

reason (optional)
: _String_  reason for rejecting.

### Response

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>

