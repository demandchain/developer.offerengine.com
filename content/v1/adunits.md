---
title: Ad Units
---

# Ad Units

Partners can add pre-packaged marketing ad units to different web pages and sites to show deals.
The ad units operate like widgets to show in-flight deals that users can click to acquire.
Up to 10 in-flight deals are selected for each ad unit based on request parameters, and they are rotated periodically.
Request parameters applicable to the [Deals API](/v1/deals) are also applicable to ad units.
<br><br>
Partners need to include only one line of JavaScript to place an ad unit on a web page.
If no deals are identified for the ad units, then a stand-by ad unit is rendered with content "40 - 80% Off at ${partner web site}".

In version 1, three types of ad units are supported:

1. 300 x 250 - Business Name, Percentage off, Image
2. 180 x 150 - Business Name, Percentage off, Image
3. 728 x 90 - Business Name, Percentage off, Image, Description, Call to action

## 300 x 250 - Business Name, Percentage off, Image
<img src="/images/ad-unit-300-250.png" alt="Ad Unit 300x250" >

    <script src="https://${partner_slug}.admin.offers.deem.com/api/v1/adunits.js?widget_size=300"></script>

## 180 x 150 - Business Name, Percentage off, Image
<img src="/images/ad-unit-180-150.png" alt="Ad Unit 180x150" >

    <script src="https://${partner_slug}.admin.offers.deem.com/api/v1/adunits.js?widget_size=180"></script>

## 728 x 90 - Business Name, Percentage off, Image, Description, Call to action
<img src="/images/ad-unit-728-90.png" alt="Ad Unit 728x90" >

    <script src="https://${partner_slug}.admin.offers.deem.com/api/v1/adunits.js"></script>

## Request Parameters
widget_size
: Size of the ad unit widget

rotate_interval_in_seconds
: Ad unit widget rotation interval in seconds

### Note
1. Request parameters are not mandatory.  By default, the "728 x 90" ad unit is rendered with a rotation interval of 10 seconds (if there is more than one deal).
2. Only in-flight deals are selected.  Card-linked offers are not selected.
3. Other request parameters applicable for the Deals API are also applicable to ad units.

###See Also
* [Deals API](/v1/deals)
