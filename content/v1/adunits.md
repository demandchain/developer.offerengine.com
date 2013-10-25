---
title: Pre-Packaged Marketing Ad Units
---

# Ad Unit Widgets

Pre-Packaged Marketing Ad Units are basically Deal Widgets to be surfaced in Partner's website that highlights information about in-flight Deals.  Maximum of 10 in-flight Deals are selected based on request parameters and are rotated periodically.  Request Parameters applicable to Deals API are applicable to Ad Units.
<br><br>
Partners have to include just one line of javascript to pull in Widgets in their website.  If there are no deals identified then Stand by Widgets will be rendered with content being "40 - 80% Off at ${partner web site}"

In Version 1 three types of Ad Unit Widgets supported:

1. 300 x 250 - Business Name, Percentage off, Image
2. 180 x 150 - Business Name, Percentage off, Image
3. 728 x 90 - Business Name, Percentage off, Image, Description, Call to action

## 300 x 250 - Business Name, Percentage off, Image
<img src="/images/ad-unit-300-250.png" alt="Ad Unit 300x250" >

    <script src="https://${partner_slug}-admin.offers.com/api/v1/adunits.js?widget_size=300"></script>

## 180 x 150 - Business Name, Percentage off, Image
<img src="/images/ad-unit-180-150.png" alt="Ad Unit 180x150" >

    <script src="https://${partner_slug}-admin.offers.com/api/v1/adunits.js?widget_size=180"></script>

## 728 x 90 - Business Name, Percentage off, Image, Description, Call to action
<img src="/images/ad-unit-728-90.png" alt="Ad Unit 728x90" >

    <script src="https://${partner_slug}-admin.offers.com/api/v1/adunits.js"></script>

## Request Parameters
widget_size
: Size of widget

rotate_interval_in_seconds
: Widget Rotation interval in seconds

### Note
1. Request parameters are not mandatory.  By default "728 x 90" widget is rendered with rotating time 10 seconds(if there are more than one deal)
2. Only in-flight, Non CLO deals are selected.
3. Other request parameters applicable for Deals API are applicable to Ad Units too.

###See Also
* [Deals API](/v1/deals)
