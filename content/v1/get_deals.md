---
title: Get Deals
---

# Get Deals

The Get Deals call returns a set of applicable deal resources based on the filtering parameters you pass in your request. You can request a broad list of available deals or very specific highly targeted deals to provide to your users.

Each deal has a number of attributes you can use to filter the Get Deals request -- the price point, the amount of inventory, the merchant, the deal title, the run date, the location, and so on. You can find all of the possible filtering parameters in the "Request Parameters" section. For more information about the deal resource, see the "Response" section.

<b>At the very least, you will want to pass location parameters and also set <i>exclude_soldout</i> to "true" when making a Get Deals call.</b>

If you make this call with no set parameters, Get Deals returns a list of <i>all</i> "in-flight" (currently active) deals across <i>all</i> geographical regions -- including deals that are sold out and deals that are <i>not</i> sold out. To avoid retrieving sold-out deals, we recommend that you set <i>exclude_soldout</i> to "true" when making this call.

## Request

	GET /api/v1/deals?api_key={api_key}

## Request Parameters

You provide the parameters as a JSON file. All parameter fields are optional. As you add a parameter, it is evaluated in a logical AND operation with any other paramaters to filter the results. For example, if the <i>title</i> parameter is set to "burger" and the <i>state</i> parameter is set to "in-flight", the filtering returns only in-flight deals that have "burger" in the title.

### Individual deal detail parameters

slug
: _Optional String_ Filter deals by a particular deal slug.

marketplace_slug
: _Optional String_ Filter deals by a particular marketplace deal slug.

title
: _Optional String_ Filter deals by title with this value ("burger" could return deals with titles "$20 off Bob's Burgers", "$10 off Burgermeister", and so on).

### State parameters

state
: _Optional String_ Filter deals in this workflow state ("in-flight", "approved", "submitted", "landed", "in-review", "rejected", "paused", and "deleted"). <b>The "in-flight" state is the most relevant state because it identifies deals currently available for purchase.</b>

show_all
: _Optional Boolean_ Show deals in all workflow states (true only).

### Category parameters

category
: _Optional String_ Filter deals by category with this value ("Foo" could return deals in the category "Food").

subcategory
: _Optional String_ Filter deals by subcategory with this value ("Me" could return deals in the subcategories "Mexican", "Mediterreanean", and "Medical - Other").

### Merchant parameters

merchant
: _Optional String_ Filter deals by merchant name with this value ("burger" could return deals with merchants named "Bob's Burger", "Burgermeister", and so on).

### Price parameters

price_min
: _Optional Integer_ Filter the minimum deal price in cents (i.e., 100 equals one dollar).

price_max
: _Optional Integer_ Filter the maximum deal price in cents.

### Location parameters

region
: _Optional String_ Filter deals by region slug, city/state, IP address, or zip code.

latitude
: _Optional String_ Filter deals by location (requires an additional <i>longitude</i> parameter).

longitude
: _Optional String_ Filter deals by location (requires an additional <i>latitude</i> parameter).

radius
: _Optional Float_ Filter deals within a circular radius around the required <i>longitude</i> and <i>latitude</i> values.

### User parameters

user
: _Optional String_ Filter deals for a specific user (user slug or email address). Required: the scheduling parameter <i>card_links_redeemed</i> must be false, and the location parameter <i>region</i> must be specified.

### Source parameters

suppliers
: _Optional Array_ Filter deals by supplier (a partner slug or set of comma-separated partner slugs).

vendors
: _Optional Array_ Filter deals by vendor (a vendor slug or set of comma-separated vendor slugs).

### Inventory parameters

num_left
: _Optional Integer_ Filter deals by the quantity of inventory left.

exclude_soldout
: _Optional Boolean_ Filter deals that are not sold out (true only).

### Scheduling parameters

runs_min
: _Optional Date_ Filter the minimum deal run date.

runs_max
: _Optional Date_ Filter the maximum deal run date.

card_links_redeemed
: _Optional Boolean_ Filter deals that are not card-linked (false only).

## Request Example

### New user account, new payment card, and a shipping address:

<%= requests("GET /api/v1/deals?api_key=1234567") %>
<%= json(OfferEngine.deals_request()) %>

## Response

The response includes the HTTP status of the request along with the associated response data provided in a JSON file.

## Response Attributes

The response JSON file contains a list of deal resources that meet the request filter parameters.

<%= get_deal_resource %>

## Response Examples

### Filter deals by the "san_francisco" region with two deals returned:

<%= headers 200 %>
<%= json(OfferEngine.deals) %>

### Filter deals by the "restaurants" category with no deals returned:

<%= headers 200 %>
<%= json(OfferEngine.deals_empty) %>

## Error Responses

Responses provided for failed requests:

### 404

error_type = "find_failed"
: Parameter information provided is invalid.

## Error Response Example

<%= headers 404 %>
<%= json(OfferEngine.deals_error()) %>
