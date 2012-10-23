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

## Example Implementation

Using just two simple API calls you can provide offers to your users. Below is a brief description of how that would work with an existing mobile application:

<img src="/images/mobile_use_example.png" alt="Mobile Example Image" > 

To get started implementing this on your own surface, go to our [Quick Start Guide](/v1/quick_start/)