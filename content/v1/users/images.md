---
title: User Images
---

# User Images

Users can have a single image.


## Create an access token

    POST /users/:user/images


### Parameters

image
: _File_


### Response

<%= headers 200 %>
<%= json(:status => "success") %>