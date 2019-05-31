require "http_request_handler/version"
require "request_handlers/default_request_handler"
require "request_handlers/delete_request_handler"
require "request_handlers/post_request_handler"
require "request_handlers/put_request_handler"
require "request_handlers/get_request_handler"

module HttpRequestHandler
  class Error < StandardError; end

  def self.send_request(http_method, options)
    handler = get_request_handler(http_method).new(options)
    Rails.logger.debug "Request #{handler.inspect}"
    return hit_and_get(handler)
  end

  def self.send_post_request(options)
    send_request(POST, options)
  end

  def self.send_put_request(options)
    self.send_request(PUT, options)
  end

  def self.get_request_handler(http_method)
    return "RequestHandlers::#{http_method.downcase.camelize}RequestHandler".constantize
  end

  def self.hit_and_get(handler)
    handler.send_request
    return handler.response_struct
  end

  POST = "post"
  PUT = "put"
  GET = "get"
  DELETE = "delete"
end
