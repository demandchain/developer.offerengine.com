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
: _Array\<String\>_ User ids to include in the batch

mode
: _String \('suppress'\|'augment'\)_ Either "suppress" to make sure the users are not sent a daily update email on the send_at day, or "augment" to allow sending the daily update to be sent that day.

send_at
: _String_ UTC Time the batch delivery should be scheduled for. Must be after tonight midnight and before tomorrow midnight.


### Response

<%= headers 201 %>
<%= json(:status => "success", :batch => OfferEngine.batch) %>


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


## Possible Batch Statuses

pending
: batch is ready and waiting for the send_at time to deliver its targeted emails.

processed
: batch has delivered all of its targeted emails successfully.

failed
: batch has delivered all of its targeted emails. One or more emails failed to send.

cancelled
: batch was cancelled before its delivery time (send_at time).