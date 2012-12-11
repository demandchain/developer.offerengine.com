---
title: Deals
---

# Deals

You can use the following deal-related resource requests to get or modify your deals:

* [Get a deal](/v1/deals/#get-a-deal)
* [Get deals near a latitude and longitude](/v1/deals/#get-deals-near-a-latitude-and-longitude)
* [Mark a deal as "externally approved"](/v1/deals/#external-approve-a-deal)
* [Mark a deal as "externally validated"](/v1/deals/#external-validate-a-deal)
* [Mark a deal as "externally rejected"l](/v1/deals/#external-reject-a-deal)

# Get a deal

This request returns a single deal resource for a specific deal.

## Request

    GET /deals/{deal_id}?api_key={api_key}

## Request Parameters

This request requires a single parameter that must be included in the HTTP URL.

deal_id
: _String_ Unique identifier slug for a specific deal

## Request Example

	GET /v1/deals/my-restaurant?api_key=1234567

## Response

The response JSON file will contain a single deal resource that matches the identifier slug provided in the request URL.

## Response Attributes

The response JSON file will contain a list of deal resources matching the request filter parameters.

<%= get_deal_resource %>

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>

## Error Responses

Responses provided for failed requests:

### 404

error_type = "find_failed"
: Parameter information provided is invalid.

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>

# Get deals near a latitude and longitude

This request returns an array of deal resources, ordered by start_at time (with the earliest first), based on the location filtering parameters passed in the request.

## Request

    GET /deals/locate?api_key={api_key}

## Request Parameters

Required location parameters should be provided as a JSON file. Results will be provided for active deals within the location area described by the request parameters.

latitude
: _Float_ latitude coordinate for origin of search

longitude
: _Float_ longitude coordinate for origin of search

radius
: _Float_ distance in miles from origin

## Request Example

<%= requests("GET /v1/deals/locate?api_key=1234567") %>
<%= json(OfferEngine.deals_locate_request()) %>

## Response

The response will provide an HTTP status of the request along with the associated response data as a JSON file.

## Response Attributes

The response JSON file will contain a list of deal resources matching the request filter parameters.

<%= get_deal_resource %>

## Response Example

<%= headers 200 %>
<%= json(OfferEngine.deals) %>

## Error Responses

Responses provided for failed requests:

### 404

error_type = "find_failed"
: Parameter information provided is invalid.

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>

# Externally approve a deal

This request marks the deal as externally approved. The deal must be in the pending external approval state to send this request successfully. This request is needed only if deals must be externally approved before they are activated for users to purchase.

## Request

    PUT /deals/{deal_id}/external_approve

## Request Parameters

This request requires a single parameter that must be included in the HTTP URL. A reason can also be included in the record through a JSON parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for approving

## Request Example

	PUT /deals/my-restaurant/external_approve?api_key=1234567

## Response

The response JSON file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response JSON file will contain a single deal state attribute.

deal
: _String_ State of the deal which should be "external-approved" after a successful request.

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "external-approved")) %>

# Externally validate a deal

This request marks the deal as externally validated. This is used to ensure that the deal meets the basic validation criteria from a third-party system before entering the "in review" state for admin.

## Request

    PUT /deals/{deal_id}/external_validate

## Request Parameters

This request requires a single parameter that must be included in the HTTP URL. A reason can also be included in the record through a JSON parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for validating

## Request Example

	PUT /deals/my-restaurant/external_validate?api_key=1234567

## Response

The response JSON file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response JSON file will contain a single deal state attribute.

deal
: _String_ State of the deal which should be "external-approved" after a successful request.

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "external-validated")) %>

## Externally reject a deal

This request marks the deal as externally rejected. The deal must be in the pending external approval or pending external validation state.

## Request

    PUT /deals/{deal_id}/external_reject

## Request Parameters

This request requires a single parameter that must be included in the HTTP URL. A reason can also be included in the record through a JSON parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for rejecting

## Request Example

	PUT /deals/my-restaurant/external_validate?api_key=1234567

## Response

The response JSON file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response JSON file will contain a single deal state attribute.

deal
: _String_ State of the deal which should be "external-approved" after a successful request.

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "rejected")) %>