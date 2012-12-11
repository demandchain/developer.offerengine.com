---
title: Leads
---

# Session Leads

* [Create a lead, given a session ID](/v1/sessions/#create-a-lead)
* [Retrieve a session](/v1/sessions/#retrieve-a-session)

## Create a lead

    POST api/v1/sessions/session_id/leads

### Parameters
source_id
: _String_ The affiliate's ID

source_type
: _String_ The type of the source. The possible value is "affiliate".

### Response

<%= headers 200 %>
