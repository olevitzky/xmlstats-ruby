module Xmlstats

  module HttpGetters

    class NetHttp

      def get(uri)
        http                     = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl             = true
        http.verify_mode         = OpenSSL::SSL::VERIFY_NONE
        headers                  = {}
        api_key                  = Xmlstats.api_key
        headers["Authorization"] = "Bearer #{api_key}" if api_key
        request                  = Net::HTTP::Get.new(uri.path, headers)
        response                 = http.request(request)

        if response.kind_of? Net::HTTPOK
          response.body
        else
          puts response.body
          raise "failed: #{response.inspect}"
        end
      end

    end

  end

end
