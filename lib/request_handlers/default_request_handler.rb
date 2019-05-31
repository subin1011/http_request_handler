module RequestHandlers
  class DefaultRequestHandler

    require 'net/http'
    require 'uri'

    attr_accessor :url, :http, :request_header, :request_body, :request, :response

    def initialize(options)
      self.url = URI(options[:api_url])
      self.http = Net::HTTP.new(url.host, url.port)
      self.http.use_ssl = true if url.scheme == "https"
      self.request_header = get_headers(options)
      self.request_body = get_body(options)
      self.set_request
    end

    def get_body(options)
      options[:request_body] = options[:request_body].to_json if options[:request_body].is_a?(Hash)
      return options[:request_body]
    end

    def get_headers(options)
      return options[:request_header]
    end

    def send_request
      self.response = self.http.request(request)
      self.response
    end

    def response_body
      return self.response.read_body
    end

    def response_code
      return self.response.code
    end

    def response_struct
      return { json: Oj.load(self.response_body), status: self.response_code, code: self.response_code }
    end
  end
end
