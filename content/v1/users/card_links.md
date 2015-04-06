---
title: User Card Links
---

# User Card Links

* [List all user's card links](/v1/users/card_links/#list-all-users-card-links)
* [Create a card link](/v1/users/card_links/#create-a-card-link)
* [Unlink a card link](/v1/users/card_links/#unlink-a-card-link)
* [Link a card link](/v1/users/card_links/#link-a-card-link)
* [Redeem a card link](/v1/users/card_links/#redeem-a-card-link)

A card link represents a user linking to a deal.  Once created, a card link will have a state of either "linked", "unlinked", or "fulfilled".

## List all user's card links
Returns an array of card link representations.

    GET /api/v1/users/:user_id/card_links

### Parameters

<%= list_parameters :applicable_filters => ["linked", "unlinked", "fulfilled"] %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_links => [OfferEngine.card_link]) %>

## Create a card link
Creates a card link for a user and a deal or batch of deals in the linked state.

    POST /api/v1/card_links

### Parameters

deal_id
: _String_  Id of the deal

or

deal_ids
: _Optional String_ Comma seperated list of deal ids (eg: ?deal_ids="first-deal,second-deal")
: _Optional Array_ Multi-value list of deal ids (eq: ?deal_ids[]="first-deal"&deal_ids[]="second-deal")

user_id
: _String_ Id of the user

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link) %>

## Unlink a card link
Used to change a card link from "linked" to "unlinked".

    PUT /api/v1/card_links/:card_link_id/unlink

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link.merge(:state => "unlinked")) %>

## Link a card link
Used to change a card link from "unlinked" to "linked".

    PUT /api/v1/card_links/:card_link_id/link

### Response

<%= headers 200 %>
<%= json(:status => "success", :card_link => OfferEngine.card_link) %>

## Redeem a card link
Used to notify us when a card link has been redeemed.

    PUT /api/v1/card_links/:card_link_id/redeem

### Parameters

transaction_amount
: _Integer_ total amount charged in cents

transaction_date
: _String_ XML DateTime formatted as "YYYY-MM-DDThh:mm:ss"; i.e. 2012-02-06T21:39:51-08:00

transaction_reference
: _String_

max_redemption
: _Boolean_ Set to true if this redemption fulfills the card link.

### Response

<%= headers 200 %>
<%= json(:status => "success") %>
