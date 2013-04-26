---
title: Deal Discussions
---

# Warning Deprecated
**This call will be removed in a future release**

# Deal Discussions

## Get a deal's discussion

    GET /discussions/:discussion_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :coupons => [OfferEngine.discussion]) %>
