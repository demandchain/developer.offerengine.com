require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'resources/user'
require 'resources/deal'
require 'resources/purchase'
require 'resources/coupon'
require 'resources/card_link'
require 'resources/batch'

module OfferEngine
  module Helpers
    FILTER = "filter (optional)
: _String_ Filter the list according to applicable filters (comma-separated)."

    COUNT = "count (optional)
: _Boolean_ Returns the count instead of the list.  If present, per_page and page will be ignored."

    PER_PAGE = "per_page (optional)
: _Integer_ Limits the size of the list.  Default is 100.  Max is 1000."

    PAGE = "page (optional)
: _Integer_ Returns the list corresponding to the page number if the result cannot be displayed in a single page.  Default is 1."

    def list_parameters(options={})
      parameters = [COUNT, PER_PAGE, PAGE]
      if options[:applicable_filters]
        parameters.unshift(FILTER + "  These include: \"#{options[:applicable_filters].join('", "')}\".")
      end
      parameters.join("\n\n")
    end
  end

  ACCESS_TOKEN = {
    id:         "zzzaaaa123",
    user_id:    "abc123",
    expires_in: 600,
    scope:      "user,credit_card",
    access:     "read,write"
  }
end

include OfferEngine::Helpers

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
