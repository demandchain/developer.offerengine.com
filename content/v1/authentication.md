---
title: Authentication
---

# Authentication

Authenticate to the OfferEngine API by providing your API key in each request. Your API key has many privileges, so you should <b>keep it secret</b>.

Your unique API key will be provided to you via your Admin console. If at any time your key has been compromised, generate a new key within Admin from the same location you received your intial key.

<b>All API requests must be made over HTTPS.</b> Calls made over plain HTTP will fail. You must authenticate for all requests.

All that needs to be done for each request is to add the api_key parameter to each request (GET, POST, and PUT) with your unique key.

## Request
	
	GET /v1/deals?api_key={api_key}

## Request Example

	GET /v1/deals?api_key=1234567