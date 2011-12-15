---
title: Users
---

# Users API

Many of the resources on the users API provide a shortcut for getting
information about the currently authenticated user. If a request URL
does not include a `:user` parameter than the response will be for the
user infered from an access token.


## Get a single user

    GET /users/:user

### Response

<%= headers 200 %>
<%= json :full_user %>