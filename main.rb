#!/usr/bin/ruby
require "socket"
puts "Starting the server"

#Open for connections
server = TCPServer.new('127.0.0.1', 80)
loop do
  Thread.start(server.accept) do |client|
    puts "New client connected from IP: #{client.peeraddr[3]}:#{client.peeraddr[1]}"
    newConnection(client)
  end
end

def newConnection(client)
  puts "hi"
  puts Thread.current.object_id
end
