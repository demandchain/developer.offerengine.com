---
title: User Credit Cards
---

# User Credit Cards

* [List all user's credit cards](/v1/users/credit_cards/#list-all-users-credit-cards)
* [Create a credit card](/v1/users/credit_cards/#create-a-credit-card)
* [Set default credit card](/v1/users/credit_cards/#set-default-credit-card)

## List all user's credit cards
Returns an array of credit card representations.

    GET /api/v1/credit_cards

### Parameters

user_id
: _String_ Id of the user

<%= list_parameters %>

### Response

<%= headers 200 %>
<%= json(:status => "success", :credit_cards => [OfferEngine.credit_card]) %>

## Create a credit card
Stores a credit card for user purchases.

    POST /api/v1/credit_cards

### Parameters

user_id
: _String_ Id of the user

number
: _String_ 16 digit credit card number.  Be sure to use HTTPS for all API calls.

verification_value
: _String_ CVV value on the back of the credit card.  Be sure to use HTTPS for all API calls.

month
: _Integer_ Expiration month in digit format.

year
: _Integer_ Expiration year in digit format.

zip_code
: _String_ The zip code for the billing address for the card.

### Response

<%= headers 200 %>
<%= json(:status => "success", :credit_card_id => OfferEngine.credit_card[:id]) %>

## Set default credit card
Make an existing credit card the default card.

Note: If a user only has one credit card, it will be the default credit card.

   PUT /api/v1/credit_cards/:credit_card_id/default

### Response

<%= headers 200 %>
<%= json(:status => "success") %>
