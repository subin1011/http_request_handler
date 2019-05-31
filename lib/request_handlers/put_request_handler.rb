module RequestHandlers
  class PutRequestHandler < DefaultRequestHandler

    def set_request
      self.request = Net::HTTP::Put.new(self.url, self.request_header)
      self.request.body = self.request_body
      return self.request
    end

  end
end
