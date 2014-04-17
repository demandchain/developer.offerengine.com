---
title: Get Deals
---

# Get Deals

The Get Deals call returns a set of applicable deal resources based on the filtering parameters you pass in your request. You can request a broad list of available deals or very specific highly targeted deals to provide to your users.

You must specify in the request the attributes you want returned in the JSON response for each deal. You may specify all available fields or a subset of fields that you need.. You may specify any, or all of the attributes available. See the "Specifying attributes to be returned" for an example and see the "Response" section for a list of all possible values.

Returned results will be sorted in descending order by deal end date. If you would like the results sorted differently, you may also specify the sort order for deals returned within the JSON response. You can find the sort options in the "Specifying sort order" section.

Each deal has a number of attributes you can use to filter the Get Deals request -- the price point, the amount of inventory, the merchant, the deal title, the run date, the location, and so on. You can find all of the possible filtering parameters in the "Specifying filters" section. For more information about the deal resource, see the "Response" section.

If you make this call with no filters, Get Deals returns a list of <i>all</i> "in-flight" (currently active) deals across <i>all</i> geographical regions -- including deals that are sold out and deals that are <i>not</i> sold out. To avoid retrieving sold-out deals, we recommend that you pass <i>filters=sold_out=false</i> when making this call.

## Request

    GET /api/v3/deals

## Specifying attributes to be returned

You provide the attributes to be included in the query string with the key word "fields".
The list of attributes to be returned should be a comma separated list of fields. Some fields (like _images_ include multiple sub-fields that can be returned. For these, you must specify which sub-fields to return inside a set of square brackets [].

    GET https://username:password@api.offers.deem.com/api/v3/deals?fields=id,title,price,region,type,images[small,large]

## Specifying sort order

You specify the sort order in the query string with the key word "sort". Ascending(asc) and Descending(desc) order can be indicated in parentheses.

    GET https://username:password@api.offers.deem.com/api/v3/deals?sort=start_at(desc)&fields=id,title,price,region,type,images[small,large]

## Specifying filters

You specify filtering in the query string with the key word "filter".

    GET https://username:password@api.offers.deem.com/api/v3/deals?filter=region[san-francisco,phoenix],sold_out[false],price>1500&fields=id,title,price,region,type,images[small,large]

As you add a parameter to the filter with a comma(,), it is evaluated with a logical AND operation with any other parameter to filter the results.

### Individual deal filter parameters

### Category parameters

category
: _Optional String_ : Filter deals by category. Deals can be returned in the category "foo" using ?filter=category[foo]. Deals can be returned in multiple categories using ?filter=category[foo,bar].

subcategory
: _Optional String_ : Filter deals by subcategory. Deals can be returned in the subcategory "foo" using ?filter=subcategory[foo]. Deals can be returned in multiple subcategories using ?filter=subcategory[foo,bar].

### Price parameters

price
: _Optional Integer_ : Filter the deal price in cents (i.e., 100 equals one dollar). Can be used in conjunction with "<", ">", "=" and combinations thereof using for instance ?filter=price>=1500. Multiple exact price matches can be selected using ?filter=price[1300,1500]

### Location parameters

region
: _Optional String_ : Filter deals by region_id. Can be used in conjunction with "[]". To select all deals from multiple regions, use ?filter=region[san-francisco,atlanta].

region_city
: _Optional String_ : Filter deals by city within two character state. Should be nested within "[]". To select a deals from multiple region cities, use ?filter=region_city[[san%20francisco,ca],[los%20angeles,ca]].

lat_long
: _Optional String_ : Filter deals by location using latitude, longitude and radius in miles. Use ?filter=lat_long[123.1112,-321.1132,5]

### Inventory parameters

sold_out
: _Optional Boolean_ : Filter deals that are either sold_out or not sold_out. Use ?filter=sold_out[false] to select deals that are not sold_out

## Response

The response includes the HTTP status of the request along with the associated response data provided in a JSON file.

## Response Attributes

The response JSON file contains a list of deal resources that meet the request filter parameters.

<%= OfferEngine::V3.deal_resource %>

## Response Examples

### Filter deals by the "los_angeles" region with two deals returned:

<%= headers 200 %>
<%= json(OfferEngine::V3.deals) %>

### Filter deals by the "restaurants" category with no deals returned:

<%= headers 200 %>
<%= json(OfferEngine::V3.deals_empty) %>

## Error Responses

Responses provided for failed requests:

### 400

status = "error"
message = "Bad request syntax"
errors = {"query_string":"fields= isd is not recognised as a valid field for inclusion in this JSON response"}}
: Parameter information provided is invalid.

## Error Response Examples

<%= headers 400 %>
<%= json(OfferEngine::V3.deals_error_no_fields_supplied()) %>

<%= headers 400 %>
<%= json(OfferEngine::V3.deals_error_sorting()) %>
