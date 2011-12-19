---
title: User Images
---

# User Images

Users can have a single image.

## Create a user image

    POST /users/:user/images


### Parameters

image
: _File_ Multi-part image data.


### Response

<%= headers 200 %>
<%= json(:status => "success") %>