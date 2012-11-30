---
title: Overview
---

# Overview

The Deem Offers application programming interface (API) lets you seamlessly integrate in-context deals with your  website, mobile app, emails, or any other internet enabled surfaces. You can include the entire sales process -- from display through purchase -- in order to provide an uninterrupted value added experience for your customers to purchase relevant deals.

This website provides all the information you need to start offering deals to your users using the Deem Offers API.

## Introduction

The Deem Offers API is [RESTful](http://en.wikipedia.org/wiki/Representational_State_Transfer), which means that it is designed to use predictable, resource-oriented URLs and HTTP response codes. We use built-in [HTTP](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) features, such as HTTP authentication and HTTP verbs, which off-the-shelf HTTP clients can understand. We support cross-origin resource sharing to allow you to interact securely with the API from a client-side web application. The API returns [JSON](http://en.wikipedia.org/wiki/JSON) in all responses, including errors.

Accounts have test-mode and live-mode API keys. Both keys can be active at the same time. Data created with test-mode credentials will never modify or alter your production data and will never actually charge purchase cards.

If you have any problems or requests, please contact [support](mailto:support@offerengine.com).

## Endpoint

<b>https://api.offers.deem.com/</b>

## Deal

A _deal_ is a product that offers goods or services from different merchants at discounted levels. 

## Purchase

A _purchase_ is a transaction in which a person (the _purchaser_) buys a quantity of unit inventory of a specific deal. A purchase results in one of the following:
* A _voucher_, which a purchaser uses to redeem the deal at the deal merchant's location or website
* A product that is shipped directly to the purchaser

## Implementation Example

You can provide deals to your customers using just two simple API calls: _get deals_ and _execute a purchase._ The following example is a brief description of how these calls work with an existing mobile application.

In this example, a partner has integrated the entire deal viewing and purchasing process into a native mobile app experience. The following diagram shows the user purchase flow and the steps needed to implement each part of the flow: 

<img src="/images/mobile_use_example.png" alt="Mobile Example Image" > 

* <b>Show Offers:</b> Request deals using the Get Deals call. The call returns a list of deals available to purchase based on the filter parameters your provide with the request. Users see a subset of the deals with just a few key aspects of each deal.

* <b>Show Offer Details:</b> When a user selects a deal, he or she lands on a detail page that describes the deal. More detailed information is provided based on the information returned in the previous Get Deals request. The user can click the *Buy now* call-to-action button to start the purchase process.

* <b>Purchase Offer</b>: The *Buy now* call-to-action button takes the user to a purchase form, where the user enters his or her purchasing information. The user presses the *Purchase* button to make the Execute Purchase request.

* <b>Redeem Offer</b> When an Execute Purchase request is successful, a purchase confirmation page appears with a link to the redemption voucher for the newly purchased deal.

To learn how to use the Deem Offers API, see our [Quick Start Guide](/v1/quick_start/).