---
title: User Images
---

# Warning Deprecated
**This call will be removed in a future release**

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