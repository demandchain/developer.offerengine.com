---
title: User Card Links
---

# User Card Links

## List all user's card links
Returns an array of card link representations.

    GET /users/:user_id/card_links


### Parameters

<%= list_parameters :applicable_filters => ["linked", "unlinked", "fulfilled"] %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_links => [OfferEngine.card_link]) %>