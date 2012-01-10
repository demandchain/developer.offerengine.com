---
title: Sessions
---

# Sessions

* [Create a session](/v1/sessions/#create-a-session)
* [Retrieve a session](/v1/sessions/#retrieve-a-session)

## Create a session

    POST api/v1/sessions

### Response

<%= headers 200 %>
<%= json(:status => "success", :session => OfferEngine.session) %>

## Retrieve a session

    GET api/v1/sessions/:session_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :session => OfferEngine.session) %>
