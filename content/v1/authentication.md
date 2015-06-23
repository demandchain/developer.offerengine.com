---
title: V1 Authentication
---

# Authentication

Authentication is a way of identifying yourself in order to gain access to the API. You authenticate yourself with the Deem Offers API by providing your unique API key in each request. <b>You must keep your unique API key secret</b>.

Your unique API key is provided in the Admin Dashboard. If at any time your key has been compromised, you can generate a new key in the Admin Dashboard.

<b>All API requests must be made over HTTPS.</b> Calls made over plain HTTP will fail. You must authenticate for all requests.

Add the api_key parameter to each GET, POST, and PUT request with the value of your unique API key:

## Request

	GET /api/v1/deals?api_key={api_key}

## Request Example

	GET /api/v1/deals?api_key=1234567
