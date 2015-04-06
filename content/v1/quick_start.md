---
title: Quick Start
---

# Quick Start

Deem Offers provides an API for integrating deals with your existing platform and services. Follow these three simple steps to get a fully functional Deem Offers API implementation up and running:

1. Authentication
2. Get Deals
3. Execute Purchases

In order to use the Deem Offers API, you must be an approved Deem Offers partner with access to your Deem Offers Admin site. If you are not a Deem Offers partner, or you can't log into your Deem Offers Admin site, please contact [support](mailto:support@deem.com).

## Step 1: Authentication

To use the Deem Offers API, you must first get your partner API key from your Deem Offers Admin website. Keep this private key secret. You will provide this key with every API call you make. Here is an example of how your requests will look:

	GET /api/v1/deals?api_key={api_key}

To learn more about authentication, see [Authentication](/v1/authentication/).

## Step 2: Get Deals

The next step after getting your API key is to request available deals to display on your internet surface (your website, your emails, or your mobile app). To get a set of available San Francisco deals with inventory that is not currently sold out, make the following request:

<%= requests("GET /api/v1/deals?api_key=1234567") %>
<%= json(OfferEngine.deals_request()) %>

This request returns a set of deal resources containing all of the information you need to display deals on your internet surface, including the deal title, availability dates, inventory quantity, purchase limits, images, and additional attributes. The response looks like this:

<%= headers 200 %>
<%= json(OfferEngine.deal_success) %>

For more information about the Get Deals call, see [Get Deals](/v1/get_deals/).

## Step 3: Execute Purchases

After displaying deals on your internet surfaces, you are ready to execute a purchase for a purchaser. This purchase can be made with one simple call that includes the following:
* user information
* payment information
* deal information
* shipping information (if needed)

The purchase request looks like this:

<%= requests("POST /api/v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request_new()) %>

When the purchase executes successfully, you receive a response similar to this:

<%= headers 200 %>
<%= json(OfferEngine.full_purchase()) %>

For more information about purchasing deals, see [Execute Purchases](/v1/full_purchase/).


## Additional Requests

Additional requests -- such as getting deals from specific locations or regions, managing user sessions, getting user information, creating targted emails, and getting statistical information -- are included with the Deem Offers API. The additional calls are not necessary to provide Deem Offers deals to your customers, but you may find them useful. To learn more about additional requests, see [Additional Calls](/v1/advanced/).
