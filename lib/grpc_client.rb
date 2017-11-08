this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

# Load Bundler and load all your gems
require "bundler/setup"

# Explicitly load any gems you need.

require "grpc_client/version"
require "sip_server_services_pb"

module GrpcClient
  # Your code goes here...
  # Good place for your main application logic if this is a library.
  #
  # Create classes in the grpc_client folder and
  # be sure to create unit tests for them too.

  puts "*** start grpc client ***"
  stub = SipServer::Action::Stub.new('localhost:50051', :this_channel_is_insecure)

  request = SipServer::Request.new(body: 'lorem ipsum', from: 'f00b4r', to: 'b4rb4z')
  response = stub.send_message(request)
  puts "*** Response [#{response.status}]: #{response.reason}"
end
