---
title: V3 Authentication
---

# Authentication

Authentication is a way of identifying yourself in order to gain access to the API. The v3 api namespace is different
than v1 in that it uses http basic authentication.  You authenticate yourself with the Deem Offers API by providing your
unique API username &amp; password with each request. <b>You must keep your unique API password secret</b>.

Your unique credentials are provided in the Admin Dashboard. If at any time your key has been compromised, you can generate a new key in the Admin Dashboard.

<b>All API requests must be made over HTTPS.</b> Calls made over plain HTTP will fail. You must authenticate for all requests.

For http basic authentication, include the username &amp; password between the protocol &amp; the domain name.

## Request

	POST https://<username>:<password>@api.offers.deem.com/v3/resellers/purchases

## Request Example

	POST https://abcd1234:La20wWgtT0PC@api.offers.deem.com/v3/resellers/purchases?deal_id=some_deal&...
