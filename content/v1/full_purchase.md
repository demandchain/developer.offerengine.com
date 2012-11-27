---
title: Execute Purchases
---

# Execute Purchases (Create a Full Purchase)

You can use the all-in-one Execute Purchases call to create a purchase, create a new user, and store a purchase card.

This single operation will create a new user if the user doesn't already exist, and execute a single purchase transaction. It will also associate the purchase card information with the user. It doesn't matter if a user or purchase card resource already exists in the system. The backend software is intelligent enough to match existing resources to fullfill the purchase properly.

## Request 

	POST /v1/purchases/full.json?api_key={api_key}

## Request Parameters

You provide the required and optional parameters as a JSON file. The required fields are: 
* <b>purchase parameters</b> (<i>deal_id, quantity</i>) 
* <b>user parameters</b> (<i>user id<i/> or <i>user resource</i>)
* <b>payment card parameters</b> (<i>credit card id</i> or <i>credit card resource</i>)
* <b>shipping address parameters</b> (<i>shipping address id</i> or <i>shipping address resource</i>) if the deal needs to be shipped

### Purchase parameters

deal_id
: _String_ ID of the deal for which you are purchasing inventory

quantity
: _Integer_ Number of deals to be purchased
<br/><br/>

### User parameters
Provide a stored ID or a complete user resource with the associated user fields (<i>email, password,</i> and <i>password_confirmation</i>).

#### User id

user_id
: _String_ ID of the user making the purchase

##### User resource

email
: _String_ Email address of the user making the purchase

password
: _String_ Password of user making the purchase

password_confirmation
: _String_ Exact duplicate of user password

first_name
: _Optional String_ First name of user

last_name
: _Optional String_ Last name of user
<br/><br/>

### Payment card parameters
Provide a stored ID or a complete payment card resource with the associated payment card fields (<i>number, verfication_value, month,</i> and <i>year</i>).

#### Payment card id

credit_card_id
: _String_  ID of the stored payment card used for purchasing

#### Payment card resource

number
: _String_  Payment card number used for purchasing

verification_value
: _String_ Verification value (CVV) for the payment card when a payment card number is provided

month 
: _String_ Two-digit month for the payment card expiration date when a payment card number is provided

year
: _String_ Four-digit year for the payment card expiration date when a payment card number is provided
<br/><br/>

### Shipping address parameters
Provide an existing ID or a complete shipping address resource with the associated shipping address fields (<i>address_one, postal_code, city, state,</i> and <i>country</i>). This is required only for deals with a "shipped" fulfillment type.

#### Shipping address id

shipping_address_id
: _String_  ID of the stored shipping address used for purchasing

#### Shipping address resource

name
: _String_ Name associated with this shipping address (Home, Work, and so on)

address_one
: _String_ First line of the shipping address

address_two
: _Optional String_ Second line of the shipping address

postal_code
: _String_ Postal/Zip code of the shipping address

city
: _String_ City name of the shipping address

state
: _String_ Two-character state abbreviation of the shipping address

country
: _String_ Two-character country abbreviation of shipping address

## Request Example

### New user account, new payment card, and a shipping address:

<%= requests("POST /v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request_new()) %>

### Existing user account, stored payment card, and no shipping address:

<%= requests("POST /v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request()) %>

## Response

The request response includes an HTTP status of the request along with the associated response data provided as a JSON file.

## Response Attributes

The response JSON file includes an overall purchase status and purchase resources for each purchase in the request.

### Status attributes

status
: _String_  State of this purchase (success or error)

### Purchases attributes

The response includes a purchase attribute, deal attributes, a user attribute, a payment card attribute, coupon attributes, and errors for each attribute that failed during the request.

#### Purchase attributes
id
: _String_ Unique identifier for this purchase

purchase_id
: _String_ Unique identifier for this purchase

payment_state
: _String_ Current state of the payment process for this purchase

fulfillment_state
: _String_ Current state of the fulfillment process for this purchase

created_at
: _String_ Date and time that the purchase record was created

deal_id
: _String_ Unique identifier for the deal purchased

deal_type
: _String_ Type of the deal purchased

price
: _Integer_ Price of the deal in cents

amount
: _Integer_ Total amount paid for the purchase in cents

number_bought
: _Integer_ Quantity of the deals bought

#### User attribute

user_id
: _String_  Unique identifier for the user making the purchase

#### Payment card attribute

credit_card_id
: _String_  Unique identifier for the payment card used to make this purchase

#### Deal attributes

id
: _String_ Unique identifier for the purchased deal 

deal_id
: _String_ Unique identifier for the purchased deal 

title
: _String_ Title of the purchased deal 

type
: _String_ Type of the purchased deal 

image_url
: _String_ Relative URL for an image associated with the purchased deal 

image_url_abs
: _String_ Absolute URL for an image associated with the purchased deal 

#### Coupon attributes

id
: _String_  Unique identifier for this purchase voucher

slug
: _String_  Unique identifier for this purchase voucher

deal_id
: _String_  Unique identifier for purchased deal 

deal_type
: _String_  Type of purchased deal ("daily-deal", "city-sampler", "private-reserve", "card-linked")

barcode
: _String_  Unique barcode used for purchase redemption

redemption_code
: _String_  Unique code used for purchase redemption

expires_at
: _String_  Date and time of the purchase voucher expiration

created_at
: _String_  Date and time that the purchase was made

state
: _String_  State of the purchase ("valid", "cancelled", "expired", "redeemed", "reissued")

redeemed_at
: _Optional String_  Date and time when the purchase voucher was redeemed

## Response Example
<%= headers 200 %>
<%= json(OfferEngine.full_purchase()) %>

## Error Responses

Responses are provided for each failed portion of the purchase request. if the user, payment card, or shipping address sections fail, the purchase does not occur. You don't have to worry that purchases might be made with invalid data. 

### 409

error_type = "already_charging"
: Existing purchase still processing

### 422

error_type = "cannot_fufill"
: Not able to fulfill the purchase

error_type = "declined"
: Purchase declined

error_type = "validations_failed"
: Validation failed, which can be five failure types ("missing_field", "missing", "invalid", "not_owner", and "not_found"). Each type also has the associated resource that caused the error ("user", "credit_card", "purchase", "shipping address") and may also have a field narrowing down the specific attribute if applicable.


## Error Response Example

### Validation errors for purchase only

<%= headers 422 %>
<%= json(OfferEngine.full_purchase_error()) %>

### Validation errors for user, payment card, purchase, and shipping address

<%= headers 422 %>
<%= json(OfferEngine.full_purchase_error_all()) %>