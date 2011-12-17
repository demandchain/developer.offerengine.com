---
title: User Card Links
---

# User Card Links

## List all user's card links
Returns an array of card link representations.

    GET /users/:user_id/card_links


### Parameters

options
: _Hash_ A list of options to customize the response results.

  filter
  : filter the list of card links to a specific state. value can be one of "linked", "unlinked", "fulfilled"

  count
  : returns the count instead of the list

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_links => [OfferEngine.card_link]) %>