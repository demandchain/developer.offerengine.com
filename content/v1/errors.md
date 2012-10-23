---
title: Errors
---

# Errors

Conventional [HTTP response codes](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) to indicate success or failure of an API request are used. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from the provided information (e.g. a required parameter was missing, a charge failed, etc.), and codes in the 5xx range indicate an error with OfferEngine's servers.

Not all errors map cleanly onto HTTP response codes. All specific errors are mentioned on a per request basis in each request explanation.

All errors return JSON with a type and message describing the particular problem that occurred with the previous request.

This section provides a high overview of the error behavior, but each api call has specific error responses explained within its own documentation.

## HTTP Status Code Summary

- <b>200</b> OK - Everything worked as expected.

- <b>400</b> Bad Request - Often missing a required parameter.

- <b>401</b> Unauthorized - No valid API key provided.

- <b>402</b> Request Failed - Parameters were valid but request failed.

- <b>404</b> Not Found - The requested item doesn't exist.

- <b>409</b> Conflict - A conflict with request and stored data.

- <b>422</b> Unprocessable Entity - The request is unprocessable.

- <b>500, 502, 503, 504</b> Server errors - something went wrong on an OfferEngine server.

## Error Types

- <b>auth_failed</b> - key provided does not match an active api key

- <b>validation_failed</b> - usually a missing required parameter

- <b>create_failed</b> - object parameters are malformed

- <b>update_failed</b> - object parameters are malformed

- <b>find_failed</b> - objects or objects could not be found as requested

- <b>purchase_failed</b> - credit card charge failed 

- <b>redeem_failed</b> - voucher could not be found or is already redeemed

## Error Message

Field providing a human readable explanation of the error that occurred 

## Error Response

<%= json(OfferEngine.error_response()) %>

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>