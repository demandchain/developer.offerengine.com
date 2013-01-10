---
title: Users
---

# Users

* [Get a user](/v1/users/#get-a-user)
* [Create a user](/v1/users/#create-a-user)
* [Update a user](/v1/users/#update-a-user)
* [Update a user by email](/v1/users/#update-a-user-by-email)

Many of the resources on the users API provide a shortcut for getting
information about the currently authenticated user. If a request URL
does not include a `:user` parameter than the response will be for the
user infered from an access token.


## Get a user

    GET /users/:user_id

### Response

<%= headers 200 %>
<%= json(:status => "success", :user => OfferEngine::USER) %>



## Create a user

    POST /users


### Parameters

email
: _String_

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_

first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

credits
: _Integer_ Amount of credits in cents. If this value is not provided, the default new user signup credit will be assigned.

partner_data
: _Hash_ Store data about a user.  Be careful to not overwrite this value.

session_id (optional)
: _STRING_ If specified, the action will find the affiliate information from the session and remember the user is created through the affiliate

### Response

<%= headers 200 %>
<%= json(:status => "success", :user_id => "abc123") %>


## Update a user

    PUT /users/:user_id


### Parameters

email
: _String_

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_

first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

pass
: _String_ Password, must be at least 5 characters long. If updating this value, pass_confirmation must also be
provided.

pass_confirmation
: _String_ Same as pass

partner_data
: _Hash_ Store data about a user.  Be careful to not overwrite this value.

is_deleted
: _Boolean_ The soft delete status of a user.

### Response

<%= headers 200 %>
<%= json(:status => "success", :user => OfferEngine::USER) %>


## Update a user by email
This particular resource can be accessed with an optional request parameter

Without the optional parameter the request will look like this

    PUT /api/v1/users/:user@email_address.com/update_by_email

With the optional parameter the request will look like this

    PUT /api/v1/users/:user@email_address.com/update_by_email?overwrite_token=true

The ramifications of this are as follows:-

* assuming the user pre-exists in the offer engine

  * if a token is included in the request but it has not changed    
  then no further action is required
    
  * if a token is included in the request and there was not a token previously    
  then no further action is required
    
  * if a token is included in the request but it has changed    
  then the overwrite_token = true option must be included:    
    * this will instruct the api to update the users token with the new value,    
    failure to include the option will result in a 422 error
  
* assuming the user does not exist yet in the offer engine

  * this resource can still be PUT to,     
  resulting in the user being created in the offer engine:    
  The overwrite token is not required in this scenario   
    

### Parameters

source
: * _String_ used for reporting
  * only valid with _api_token_

token
: * _String_ partner token
  * only valid with _api_token_
  * see note above: optional overwrite_token=true might be required on the request
  
first_name
: _String_

last_name
: _String_

birthday
: _String_

postal_code
: _String_

partner_data
: _Hash_ Store data about a user.  Be careful to not overwrite this value.

is_deleted
: _Boolean_ The soft delete status of a user.


### Response

<%= headers 200 %>
<%= json(:status => "success", :user => OfferEngine::USER) %>

* if the token has changed for an existing user and the overwrite_token=true option    
  was not included on the request then the reponse will be

<%= headers 422 %>
<%= json(:status => "error", :error_type => "update_failed", :error_msg => "Unable to update, partner token has changed") %>

