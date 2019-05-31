module RequestHandlers
  class PostRequestHandler < DefaultRequestHandler

    attr_accessor :form_data

    def initialize(options)
      self.form_data = options[:form_data]
      super
    end

    def set_request
      self.request = Net::HTTP::Post.new(self.url, self.request_header)
      self.request.body = self.request_body
      self.request.set_form_data(form_data: self.request_body) if self.form_data
      return self.request
    end
  end
end
