---
title: Card Links
---

# Card Links

## Create a card link
Creates a card link for a user and a deal in the linked state.

    POST /card_links


### Parameters

deal_id
: _String_  Id of the deal

user_id
: _String_  Id of the user

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link) %>


