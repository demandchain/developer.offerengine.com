---
title: User Access Tokens
---

# Warning Deprecated
**This call will be removed in a future release**

# User Access Tokens

Access tokens are temporary tokens which allow users to call APIs directly. Think JavaScript checkout flows, and the like.


## Create an access token

    POST /users/:user/access_tokens


### Parameters

expires_in
: _Integer_ time to live in seconds

scope
: * _String_ comma separated resources Examples: `user`, `credit_card`
  * `all` for unlimited

access
: _String_ `read`, `write`, `read,write`


### Response

<%= headers 200 %>
<%= json(:status => "success", :access_token => OfferEngine::ACCESS_TOKEN) %>