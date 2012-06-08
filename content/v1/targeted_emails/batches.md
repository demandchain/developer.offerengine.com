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
: _STRING_ Partners API key

deal_id
: _STRING_ The deal id associated with the batch. Used to verify that the batch is associated with this deal

### Response

<%= headers 200 %>
<%= json(:status => "success", :batch => OfferEngine.batch) %>


## Create a batch

    POST /v1/targeted_email/batches


### Parameters

api_key
: _String_ Partners api_key

deal_id
: _String_ Deal slug that this batch is bound to

user_ids
: _Array_ Of strings containing the user slugs to include in the batch

mode
: _String_ Either "suppress" to make sure the users are not sent a daily update email or "augment" to send email as usual

send_at
: _String_ Date the batch should be scheduled for


### Response

<%= headers 201 %>
<%= json(:status => "success", :batch => OfferEngine.batch) %>


## Cancel a batch
Cancels the batch.

    DELETE /v1/targeted_email/batches/:batch_id

### Parameters
api_key
: _STRING_ Partners API key

batch_id
: _STRING_ The batch id to cancel

deal_id
: _STRING_ The deal id associated with the batch. Used to verify that the batch is associated with this deal

### Response

<%= headers 200 %>
<%= json(:status => "success", :batch => {:send_at => "2012-06-09T12:00:00Z", :deal_id =>  "a-50-for-100-worth-of-dining9d343eaf", :status => "cancelled", :user_ids => ["3f586cbb"], :mode => "suppress", :id => "e8f6859a"}) %>
