---
title: Targeted Emails Batches
---

# Batches

* [Get a batch](/v1/targeted_emails/batches/#get-a-batch)
* [Create a batch](/v1/targeted_emails/batches/#create-a-batch)
* [Cancel a batch](/v1/targeted_emails/batches/#cancel-a-batch)

## Get a batch
Returns a serialized representation of the batch.

    GET /v1/targeted_email/batches/:batch_id

### Parameters

api_key
: _String_ Partners API key

deal_id
: _String_ The deal id associated with the batch. Used as a guard to verify that the batch is associated with this deal

### Response

<%= headers 200 %>
<%= json(:status => "success", :batch => OfferEngine.batch) %>

### Response Errors

##### deal_id
deal_id is absent
: "is required"

deal_id is unknown
: "unknown deal"

deal does not match batch's deal
: "does not match this batch"


## Create a batch
Creates a new targeted email batch. 
Limited to 1000 user ids per request.
Limited to 10 000 scheduled user ids per send_at day.

    POST /v1/targeted_email/batches


### Parameters

api_key
: _String_ Partners api_key

deal_id
: _String_ Deal id that this batch is bound to

user_ids
: _Array\<String\>_ User ids to include in the batch. Any invalid user id will be dropped and as long as there are valid user ids left, the batch will be created and only the valid user ids will be added to the batch. A user id is invalid if it doesn't exist, or if that user id is already present in another batch scheduled for the same date as the requested send_at date.

mode
: _String \('suppress'\|'augment'\)_ Either "suppress" to make sure the users are not sent a daily update email on the send_at day, or "augment" to allow sending the daily update to be sent that day.

send_at
: _String_ UTC Time the batch delivery should be scheduled for. Must be after tonight midnight and before tomorrow midnight.


### Response

<%= headers 201 %>
<%= json(:status => "success", :batch => OfferEngine.batch) %>

### Response Errors

##### deal_id
deal_id is absent
: "is required"

deal_id is unknown
: "unknown deal"

deal is not in-flight or or approved
: "deal's status must be in-flight or approved"

##### send_at
send_at is absent
: "is required"

send_at is not tomorrow
: "must be tomorrow"

send_at is before deal start time
: "must be after deal's start time"

send_at is after deal end time
: "must be before deal's end time"

##### user_ids
is absent
: "is required"

all are invalid or do not exist
: "are all invalid"

all user_ids already scheduled for that day
: "are all already scheduled for that day"

##### mode
is absent
: "is required"

is invalid
: "must be either (...)"

## Cancel a batch
Cancels the batch.

    DELETE /v1/targeted_email/batches/:batch_id

### Parameters
api_key
: _String_ Partners API key

batch_id
: _String_ The batch id to cancel

deal_id
: _String_ The deal id associated with the batch. Used as a guard to verify that the batch is associated with this deal.

### Response

<%= headers 200 %>
<%= json(:status => "success", :batch => {:send_at => "2012-06-09T12:00:00Z", :deal_id =>  "a-50-for-100-worth-of-dining9d343eaf", :status => "cancelled", :user_ids => ["3f586cbb"], :mode => "suppress", :id => "e8f6859a"}) %>

### Response Errors

##### deal_id
deal_id is absent
: "is required"

deal_id is unknown
: "unknown deal"

deal does not match batch's deal
: "does not match this batch"

##### batch_id
batch is already processed
: "is already processed, cannot be cancelled"

## Possible Batch Statuses

pending
: batch is ready and waiting for the send_at time to deliver its targeted emails.

processed
: batch has delivered all of its targeted emails successfully.

failed
: batch has delivered all of its targeted emails. One or more emails failed to send.

cancelled
: batch was cancelled before its delivery time (send_at time).