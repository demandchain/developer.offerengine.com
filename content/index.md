---
title: Overview
---

# Overview

This API provides the ability for you to include in-context Offers within your existing website, mobile app, emails, or any other internet enabled surfaces. The entire sales process, display through purchase, can be seamlessly integrated providing your customers an uninterrupted value added experience to purchase relevant offers when and where you see fit.

On this website, we will provide all the information you need to start providing offers to your users using Deem Offers API.

## Introduction

This is a [RESTful](http://en.wikipedia.org/wiki/Representational_State_Transfer) API. Our API is designed to have predictable, resource-oriented URLs and to use HTTP response codes to indicate API errors. We use built-in [HTTP](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) features, like HTTP authentication and HTTP verbs, which can be understood by off-the-shelf HTTP clients, and we support cross-origin resource sharing to allow you to interact securely with our API from a client-side web application. [JSON](http://en.wikipedia.org/wiki/JSON) will be returned in all responses from the API, including errors.

Accounts have test-mode API keys, as well as live-mode API keys. These keys can be active at the same time. Data created with test-mode credentials will never modify or alter your production data and will never actually charge purchase cards.

If you have any problems or requests please contact [support](mailto:support@offerengine.com).

## Endpoint

<b>https://api.offers.deem.com/</b>

## Deal

A deal is a product offering goods or services from different merchants at discounted levels. 

## Purchase

A purchase is buying a quantity of unit inventory of a specific deal which results in either a voucher, to redeem the deal at the deal merchant's location or website, being bought or a good being shipped directly to the purchaser.

## Example Implementation

Using just two simple API calls (get deals and execute purchase) you can provide offers to your users. Below is a brief description of how that would work with an existing mobile application:

In this example, a partner has integrated the entire deal viewing and purchasing process into their existing native mobile app experience. Below is a diagram of the user purchase flow as well as a description of the steps needed to implement each step: 

<img src="/images/mobile_use_example.png" alt="Mobile Example Image" > 

* Show Offers - request deals with the Deem Offers Get Deals call. A list of deals available to purcahse will be returned based upon your request filter parameters. A subset of deals are displayed to the user with just a few key aspects of the deal.

* Show Offer Details - if a user is interested in a deal from the list, they select it taking them to a detail page about the deal. From the information returned in the previous Get Deals call, more detailed information is provided about this specific deal. A buy now call to action button is provided to start the purchase process.

* Purchase Offer - the buy now call to action button takes the use to a purchase form where they enter all of their purchase information. When the user presses the purchase button, the Deem Offers Execute Purchase request is made.

* Redeem Offer - on successful return of the Execute Purchase request, a purchase confirmation page is shown with a link to the redemption voucher for the deal the user just purchased.

To get started implementing this on your own surface, go to our [Quick Start Guide](/v1/quick_start/)