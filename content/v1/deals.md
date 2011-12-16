---
title: Deals
---

# Deals


## Get a deal

    GET /deals/:deal_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>

