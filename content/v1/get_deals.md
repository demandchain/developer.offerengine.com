---
title: Get Deals
---

# Get Deals

This api call will return a set of applicable deal resources based upon the filtering parameters passed in the request. You can request a broad list of available deals or very specific highly targeted deals to provide to your users.

Each deal has a number of attributes that can be filtered on using this API call. Everything from price point, inventory, merchant, deal title, run date, location, etc... All of the possible filtering parameters are mentioned below in the Request Parameters section. Also, a detailed explanation of the deal construct can be found in the Response section to provide further background information on what a deal resource looks like.

<b>For most use cases, you will want to at least pass location parameters and exclude_soldout set to "true" when making a call.</b>

If you make this call with no parameters set, a list of ALL "in-flight" (currently active) deals across ALL geographical regions which are sold out and NOT sold out will be returned. It is recommended to at least set the exclude_souldout to "true" when making this call.

## Request 

	GET /v1/deals?api_key={api_key}

## Request Parameters

Required and optional parameters should be provided as a json file. All parameter fields are optional. Each additional parameter added acts as an <b>AND</b> to further filter the results that will be provided in the response.

### individual deal detail parameters

slug
: _Optional String_ Filter deals by a particular deal slug

marketplace_slug
: _Optional String_ Filter deals by a particular marketplace deal slug

title
: _Optional String_ Filter deals by title with this value in it ("burger" could return deals with title "$20 off Bob's burgers", "$10 off Burgermeister", etc...)

### state parameters

state
: _Optional String_ Filter deals in this workflow state (in-flight, approved, submitted, landed, in-review, rejected, paused, deleted) <b>in-flight is the most relevant state because it identifies deals currently available for purchase</b>

show_all
: _Optional Boolean_ Show deals in all workflow states (true only)

### category parameters

category
: _Optional String_ Filter deals by category with this value in it ("Foo" could return deals in the category "Food")

subcategory
: _Optional String_ Filter deals by subcategory with this value in it ("Me" could return deals in the subcategories "Mexican", "Mediterreanean", and "Medical - Other")

### merchant parameters

merchant
: _Optional String_ Filter deals by merchant name with this value in it ("burger" could return deals with merchants named "Bob's Burger", "Burgermeister", etc...)

### price parameters

price_min
: _Optional Integer_ Filter minimum deal price in cents

price_max 
: _Optional Integer_ Filter maximum deal price in cents

### location parameters

region
: _Optional String_ Filter deals by region slug, city/state, IP address, or zip

latitude
: _Optional String_ Filter deals by location (require longitude parameter)

longitude
: _Optional String_ Filter deals by location (require latitude parameter)

radius
: _Optional Float_ Filter deals within circular radius around longitude and latitude values 

### user parameters

user
: _Optional String_ Filter deals for user (user slug or email) Required: card_links_redeemed must be false and region must be specified

### source parameters

suppliers 
: _Optional Array_ Filter deals by supplier in the form of partner slugs or comma separated partner slugs

vendors
: _Optional Array_ Filter deals by vendor in the form of partner slugs or comma separated partner slugs

### inventory parameters
 
num_left
: _Optional Integer_ Filter deals by the quantity of inventory left

exclude_soldout
: _Optional Boolean_ Filter deals that are not sold out (true only)

### scheduling parameters

runs_min
: _Optional Date_ Filter minimum deal run date

runs_max
: _Optional Date_ Filter maximum deal run date

card_links_redeemed
: _Optional Boolean_ Filter deals that are not card linked (false only)

## Request Example

### New user account, new credit card, and a shipping address

<%= requests("GET /v1/deals?api_key=1234567") %>
<%= json(OfferEngine.deals_request()) %>

## Response

The request response will provide a http status of the request along with the associated response data provided as a json file

## Response Attributes

The response json file will contain a list of deal resources meeting the request filter parameters

<%= get_deal_resource %>

## Response Example

### filter deals by "san_francisco" region with two deals returned

<%= headers 200 %>
<%= json(OfferEngine.deals) %>

### filter deals by "restaurants" category with no deals returned 

<%= headers 200 %>
<%= json(OfferEngine.deals_empty) %>

## Error Responses

Responses provided for failed requests

### 404

error_type = "find_failed"
: Parameter information provided is invalid

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>