---
title: Deals
---

# Deals

The following deal related resource requests can be made to get or modify your deals.

* [Get a deal](/v1/deals/#get-a-deal)
* [Get deals near latitude & longitude](/v1/deals/#get-deals-near-a-latitude-and-longitude)
* [External approve a deal](/v1/deals/#external-approve-a-deal)
* [External validate a deal](/v1/deals/#external-validate-a-deal)
* [External reject a deal](/v1/deals/#external-reject-a-deal)

# Get a deal

This API call will return a single deal resource for the specific deal requested

## Request

    GET /deals/{deal_id}?api_key={api_key}

## Request Parameters

Only a single parameter exists for this call, which is included in the HTTP URL.

deal_id
: _String_ Unique identifier slug for a specific deal

## Request Example

	GET /v1/deals/my-restaurant?api_key=1234567

## Response

The response json file will contain a single deal resource with the matching deal id provided in the request URL.

## Response Attributes

The response json file will contain a list of deal resources meeting the request filter parameters

<%= get_deal_resource %>

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal) %>

## Error Responses

Responses provided for failed requests

### 404

error_type = "find_failed"
: Parameter information provided is invalid

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>

# Get deals near a latitude and longitude

This API call returns an array of deal resources, ordered by start_at time with the earliest first, based upon the location filtering parameters passed in the request.

## Request

    GET /deals/locate?api_key={api_key}

## Request Parameters

Required location parameters should be provided as a json file. Results will be provided for active deals within the location area described with the request parameters.

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

The response will provide a HTTP status of the request along with the associated response data provided as a json file

## Response Attributes

The response json file will contain a list of deal resources meeting the request filter parameters.

<%= get_deal_resource %>

## Response Example

<%= headers 200 %>
<%= json(OfferEngine.deals) %>

## Error Responses

Responses provided for failed requests

### 404

error_type = "find_failed"
: Parameter information provided is invalid

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>

# External approve a deal

This API call will mark the deal as externally approved. The deal must be pending external approval state to send this request successfully. This request is only needed when external approval of deals are needed before they are activated for users to purchase.

## Request

    PUT /deals/{deal_id}/external_approve

## Request Parameters

Only a single required parameter exists for this call, which is included in the HTTP URL. A reason can also be included in the record through a json parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for validating

## Request Example

	PUT /deals/my-restaurant/external_approve?api_key=1234567

## Response

The response json file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response json file will contain a single deal state attribute

deal
: _String_ State of the deal which should be "external-approved" upon successful request

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "external-approved")) %>

# External validate a deal

This API call will mark the deal as externally validated. This is used to ensure the deal meets basic validation criteria from a 3rd party system before entering the 'in review' state for admin.

## Request

    PUT /deals/{deal_id}/external_validate

## Request Parameters

Only a single required parameter exists for this call, which is included in the HTTP URL. A reason can also be included in the record through a json parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for validating

## Request Example

	PUT /deals/my-restaurant/external_validate?api_key=1234567

## Response

The response json file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response json file will contain a single deal state attribute

deal
: _String_ State of the deal which should be "external-approved" upon successful request

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "external-validated")) %>

## External reject a deal

This API call will mark the deal as externally rejected. The deal must be pending external approval or pending external validation.

## Request

    PUT /deals/{deal_id}/external_reject

## Request Parameters

Only a single required parameter exists for this call, which is included in the HTTP URL. A reason can also be included in the record through a json parameter.

deal_id
: _String_ Unique identifier slug for a specific deal

reason
: _Optional String_ Reason for validating

## Request Example

	PUT /deals/my-restaurant/external_validate?api_key=1234567

## Response

The response json file will contain the deal state attribute for the deal specificed in the request URL.

## Response Attributes

The response json file will contain a single deal state attribute

deal
: _String_ State of the deal which should be "external-approved" upon successful request

## Response Example

<%= headers 200 %>
<%= json(:status => "success", :deal => OfferEngine.deal.merge(:state => "rejected")) %>