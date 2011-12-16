require 'pp'
require 'yajl/json_gem'
require 'stringio'

module OfferEngine
  USER = {
    id:         "ABC123",
    slug:       "ABC123",
    firstname:  "deal",
    lastname:   "seeker",
    image_url:  "http://graph.facebook.com/508354830/picture?type=large",
    points:     100,
    token:      "partner_provided"
  }

  FULL_USER = USER.merge(
    about:        "I want more deals!",
    credits:      0,
    credit_cards: {
      todo: "PLEASE"
    },
    member_since: "12/25/2011",
    birthday:     "12/25/1980",
    zip:          "94110",
    gender:       "male",
    shipping_addresses: {
      todo: "PLEASE"
    }
  )

  ACCESS_TOKEN = {
    id:         "zzzaaaa123",
    user_id:    "abc123",
    expires_in: 600,
    scope:      "user,credit_card",
    access:     "read,write"
  }
end

module GitHub
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        204 => '204 No Content',
        301 => '301 Moved Permanently',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://api.github.com/resource?page=2>; rel="next",'
              lines << '      <https://api.github.com/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        # lines << "X-RateLimit-Limit: 5000"
        # lines << "X-RateLimit-Remaining: 4999"

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end
    end
  end
end

include GitHub::Resources::Helpers
