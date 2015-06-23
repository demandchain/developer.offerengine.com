---
title: User Shipping Addresses
---

# User Shipping Addresses

## Create a shipping address for user
Store a shipping address for a user

Note: All addresses are geo-located and corrected for typos.

    POST /api/v1/shipping_addresss

### Parameters

name
: _String_

address_one
: _String_

address_two
: _String_

city
: _String_

state
: _String_

country
: _String_

telephone
: _String_

user_id
: _String_ Id of the user


### Response

<%= headers 200 %>
<%= json(:status => "success") %>

