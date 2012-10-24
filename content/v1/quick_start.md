---
title: OfferEngine API Quick Start
---

# OfferEngine API Quick Start

Deem Offers provides APIs allowing you to integrate Offers content into your existing platform and services. Only, three simple steps are needed to get a fully functional Deem Offers API implementation up and running:

* Authentication
* Get Deals
* Execute Purchases

In order to continue, you must be an approved Deem Offers partner and have access to your Deem Offers Admin site. If you are not a Deem Offers partner or cannot log into your Deem Offers Admin site, please contact [support](mailto:support@offerengine.com).

## Step 1 - Authentication

As a new Deem Offers API user, you must first get your partner api key from your Deem Offers Admin website. Keep this private key secret. You will provide this key with every API call you make. Here is an example of how your requests will look:

	GET /v1/deals?api_key={api_key}

Additional authentication information can be found here: [Authentication](/v1/authentication/)

## Step 2 - Get Deals

Once you have your api key, you can now request available deals which you can display on your website, in emails, or in your mobile app (surfaces). To get a set of deal inventory available in San Francisco, you can make a request like the one below: 

<%= requests("GET /v1/deals?api_key=1234567") %>
<%= json(OfferEngine.deals_request()) %>

This will return a set of deal resources containing all of the information you need to display deals on your surface (title, availability dates, inventory quantity, purchase limits, images, and additional attributes). It will look like this:

<%= headers 200 %>
<%= json(OfferEngine.deal_success) %>

Additional deal inventory request information can be found here: [Get Deals](/v1/get_deals/)

## Step 3 - Execute Purchases

Deals have been displayed on your different surfaces and a user wants to purchase one. This purchase can be made with one simple call that includes: user information, payment information, deal information, and shipping information, if needed. The purchase request will look like this:

<%= requests("POST /v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request_new()) %>

When the purchase executes successfully, you will receive a response similar to this:

<%= headers 200 %>
<%= json(OfferEngine.full_purchase()) %>

Additional deal purchase information can be found here: [Execute Purchases](/v1/full_purchase/)


## Additional Requests

Additional functionality is provided through the Deem Offers API and it can found here: [Additional Requests](/v1/advanced/)