module RequestHandlers
  class GetRequestHandler < DefaultRequestHandler

    def set_request
      self.request = Net::HTTP::Get.new(self.url, self.request_header)
    end

  end
end
