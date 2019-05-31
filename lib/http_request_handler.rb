require "http_request_handler/version"
require "request_handlers/default_request_handler"
require "request_handlers/delete_request_handler"
require "request_handlers/post_request_handler"
require "request_handlers/put_request_handler"
require "request_handlers/get_request_handler"

module HttpRequestHandler
  class Error < StandardError; end
  # Your code goes here...
end
