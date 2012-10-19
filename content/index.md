---
title: OfferEngine API
---

# OfferEngine API Introduction

Deem Offers provides APIs allowing you to integrate Offers content into your existing platform and services.

Using two simple API calls you can provide in-context Offers within your existing website, mobile app, emails, or any other internet enabled surface. The entire sales process, display through purchase, can be seamlessly integrated providing your customers an uninterrupted user experience.

On this website, we would like to provide all the information you will need to start using Deem Offers APIs.

Specifically, you will find information to:

* [Authenticate your calls](/v1/authentication/)
* [Get Deal inventory](/v1/get_deals/)
* [Make Deal purchases](/v1/full_purchase/)

## Overview

This is a RESTful API. Our API is designed to have predictable, resource-oriented URLs and to use HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which can be understood by off-the-shelf HTTP clients, and we support cross-origin resource sharing to allow you to interact securely with our API from a client-side web application. JSON will be returned in all responses from the API, including errors.

Accounts have test-mode API keys, as well as live-mode API keys. These keys can be active at the same time. Data created with test-mode credentials will never modify or alter your production data and will never actually charge credit cards.

If you have any problems or requests please contact [support](mailto:support@offerengine.com).

## Endpoint

<b>https://api.offers.deem.com/</b>

## Basic Actions

The basic actions needed to provide offers to your users are: 

* to get a list of available offers, which then are displayed by you on your surfaces
* to make a purchase of an offer for your users. 

The following two separate requests are required to perform these actions:

* [Get Deals](/v1/get_deals/)
* [Execute Purchases](/v1/full_purchase/)

Additional requests providing advanced features can be found here:

* [Additional Requests](/v1/advanced/)
