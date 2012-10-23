---
title: Full Purchase
---

# Create a Full Purchase

All in one api call to create a purchase, new user, and store a purchase card

This single operation will create a new user, if that user doesn't already exist, execute a single purchase transaction, and will associate purchase card information with the user

It doesn't matter if a user or purchase card resource already exists in the system. The backend software is intelligent enough to match existing resources to fullfill the purchase properly.

## Request 

	POST /v1/purchases/full.json?api_key={api_key}

## Request Parameters

Required and optional parameters should be provided as a json file. The required fields are: <b>purchase parameters (deal_id, quantity), user parameters (user id or user resource), credit card parameters (credit card id or credit card resource), and shipping address parameters (shipping address id or shipping address resource) if the offer needs to be shipped</b>

### purchase parameters

deal_id
: _String_ Id of the deal you are purchasing inventory for

quantity
: _Integer_ Number of deals to be purchased
<br/><br/>

### user parameters
Provide a <b>stored id or a complete user resource</b> with the associated user fields (email, password, password_confirmation)

#### user id

user_id
: _String_ Id of the user who is making the purchase

##### user resource

email
: _String_ Email address of the user who is making the purchase

password
: _String_ Password of user making the purchase

password_confirmation
: _String_ Exact duplicate of user password

first_name
: _Optional String_ First name of user

last_name
: _Optional String_ Last name of user
<br/><br/>

### credit card parameters
Provide a <b>stored id or a complete credit card resource</b> with the associated credit card fields (number, verfication_value, month, year)

#### credit card id

credit_card_id
: _String_  Id of stored purchase card being used for purchase

#### credit card resource

number
: _String_  Credit card number being used for purchase

verification_value
: _String_ Verification value (CVV) from purchase card when purchase card number

month 
: _String_ 2 digit month from purchase card when purchase card number

year
: _String_ 4 digit year from purchase card when purchase card number
<br/><br/>

### shipping address parameters
Provide an <b>existing id or a complete shipping address resource</b> with the associated shipping address fields (address_one, postal_code, city, state, country). This is only required for deals with a "shipped" fulfillment type.

#### shipping address id

shipping_address_id
: _String_  Id of stored shipping address being used for purchase

#### shipping address resource

name
: _String_ Name associated with this shipping address (Home, Work, ...)

address_one
: _String_ First line of shipping address

address_two
: _Optional String_ Second line of shipping address

postal_code
: _String_ Postal/Zip code of shipping address

city
: _String_ City name of shipping address

state
: _String_ Two character state abbreviation of shipping address

country
: _String_ Two character country abbreviation of shipping address

## Request Example

### new user account, new purchase card, and a shipping address

<%= requests("POST /v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request_new()) %>

### existing user account, stored purchase card, and no shipping address

<%= requests("POST /v1/purchases/full.json") %>
<%= json(OfferEngine.full_purchase_request()) %>

## Response

The request response will provide a http status of the request along with the associated response data provided as a json file

## Response Attributes

The response json file will contain: an overall purchase status plus purchase resources for each purchase in the request

### status attributes

status
: _String_  State of this purchase (success or error)

### purchases attributes

Will contain a purchase attribute, deal attributes, user attribute, credit card attribute, and coupon attributes or errors for each attribute that failed during the request

#### purchase attributes
id
: _String_ Unique identifier for this purchase

purchase_id
: _String_ Unique identifier for this purchase

payment_state
: _String_ Current state of the payment process for this purchase

fulfillment_state
: _String_ Current state of the fulfillment process for this purchase

created_at
: _String_ Date and time purchase record was created

deal_id
: _String_ Unique identifier for deal purchased

deal_type
: _String_ Type of the deal purchased

price
: _Integer_ Price of the deal in cents

amount
: _Integer_ Total amount paid for purchase in cents

number_bought
: _Integer_ Quantity of deals bought

#### user attribute

user_id
: _String_  Unique identifier for purchasing user

#### credit card attribute

credit_card_id
: _String_  Unique identifier for purchase card used to make this purchase

#### deal attributes

id
: _String_ Unique identifier for deal purchased

deal_id
: _String_ Unique identifier for deal purchased

title
: _String_ Title of the deal purchased

type
: _String_ Type of the deal purchased

image_url
: _String_ Relative URL for image associated with the deal purchased

image_url_abs
: _String_ Absolute URL for image associated with the deal purchased

#### coupon attributes

id
: _String_  Unique identifier for this purchase voucher

slug
: _String_  Unique identifier for this purchase voucher

deal_id
: _String_  Unique identifier for deal purchased

deal_type
: _String_  Type of deal purchased (daily-deal, city-sampler, private-reserve, card-linked)

barcode
: _String_  Unique barcode used for purchase redemption

redemption_code
: _String_  Unique code used for purchase redemption

expires_at
: _String_  Date and time of purchase voucher expiration

created_at
: _String_  Date and time purchase was made

state
: _String_  State of the purchase (valid, cancelled, expired, redeemed, reissued)

redeemed_at
: _Optional String_  Date and time when purchase voucher was redeemed

## Response Example
<%= headers 200 %>
<%= json(OfferEngine.full_purchase()) %>

## Error Responses

Responses are provided for each portion of the purchase request that fail. if the user, credit card, or shipping address sections error, a purchase will not occur. you don't have to worry about purchases being made with invalid data. 

### 409

error_type = "already_charging"
: Existing purchase still processing

### 422

error_type = "cannot_fufill"
: Not able to fulfill purchase

error_type = "declined"
: Purchase declined

error_type = "validations_failed"
: Validation failed which can have 5 types (missing_field, missing, invalid, not_owner and not_found). Each type will also have the associated resource that caused the error (user, credit_card, purchase, shipping address) and may have a field narrowing down the specific attribute if applicable.


## Error Response Example

### Validation errors for purchase only

<%= headers 422 %>
<%= json(OfferEngine.full_purchase_error()) %>

### Validation errors for user, credit card, purchase, and shipping address

<%= headers 422 %>
<%= json(OfferEngine.full_purchase_error_all()) %>