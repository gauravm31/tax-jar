module TaxJarGem
  class Api
    include HTTParty
    Url = 'https://api.taxjar.com/sales_tax'
    AuthenticationKey = 'e23e55ad5517d0c891b57264ec238413'

    def initialize(url = Url, auth_key = AuthenticationKey)
      @url = url
      @auth_key = auth_key
      @try_count = 0
    end

    def get(options = {})
      if (response = send_api_request(options))
        parsed_response = response.parsed_response
        raise TaxJarError('There is some problem with the parameters. Please check and try again.') if should_raise_for_response?(response.code)
        parsed_response
      end
    end

    def send_api_request(options = {})
      begin
        return HTTParty.get(@url, query: options, headers: { "Authorization" => "Token token=#{@auth_key}" })
      rescue StandardError => e
        if should_retry_if_fails?
          @try_count += 1
          send_api_request(options)
        else
          raise e
        end
      end
    end

    private

      def should_retry_if_fails?
        @try_count < 5
      end

      def should_raise_for_response?(response_code)
        @throws_exceptions && (400..500).include?(response_code)
      end
  end
end