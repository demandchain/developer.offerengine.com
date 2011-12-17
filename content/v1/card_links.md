---
title: Card Links
---

# Card Links
A card link represents a user linking to a deal.  Once created, a card link will have a state of either "linked", "unlinked", or "fulfilled".

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

## Unlink a card link
Used to change a card link from "linked" to "unlinked".

    PUT /card_links/:card_link_id/unlink

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link.merge(:state => "unlinked")) %>

## Link a card link
Used to change a card link from "unlinked" to "linked".

    PUT /card_links/:card_link_id/link

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link) %>

## Redeem a card link
Used to notify us when a card link has been redeemed.

    POST /card_links/:card_link_id/redeem

### Parameters

total_amount
: _Integer_ total amount charged in cents

### Response

<%= headers 200 %>
<%= json(:status => "success") %>
