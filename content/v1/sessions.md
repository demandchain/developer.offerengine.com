---
title: Sessions
---

# Sessions

* [Create a session](/v1/sessions/#create-a-session)

## Create a session

    POST api/v1/sessions

### Response

<%= headers 200 %>
<%= json(:status => "success", :session => OfferEngine.session) %>
