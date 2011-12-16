---
title: Users
---

# Users

Many of the resources on the users API provide a shortcut for getting
information about the currently authenticated user. If a request URL
does not include a `:user` parameter than the response will be for the
user infered from an access token.


## Get a user

    GET /users/:user_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :user => OfferEngine::USER) %>



## Create a user

    POST /users


### Parameters

email
: _String_

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_

first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

credits
: _Integer_ Amount of credits in cents. If this value is not provided, the default new user signup credit will be assigned.

partner_data
: _Hash_ Store data about a user.  Be careful to not overwrite this value.

### Response

<%= headers 200 %>
<%= json(:status => "success", :user_id => "abc123") %>


## Update a user

    PUT /users/:user_id


### Parameters

email
: _String_

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_

first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

partner_data
: _Hash_ Store data about a user.  Be careful to not overwrite this value.

is_deleted
: _Boolean_ The soft delete status of a user.

### Response

<%= headers 200 %>
<%= json(:status => "success", :user => OfferEngine::USER) %>
