#!/usr/bin/ruby
#Support functions
require "socket"
require_relative "clientConnection.rb"

def main(argv)
  #Parsing input parameters
  args = parseParams(ARGV)
  if args["-h"] then
    printHelp()
  end
  puts "Opening connection for IP #{args['-i']}:#{args['-p']}"
  #Open for connections
  server = TCPServer.new(args['-i'], args['-p'])
  puts "Port accepted, awaiting clients"
  loop do
    Thread.start(server.accept) do |client|
      puts "New client connected from IP: #{client.peeraddr[3]}:#{client.peeraddr[1]}"
      ClientConnection.new(client)
    end
  end
end

#HELPER FUNCTIONS
def parseParams(input)
  output = Hash.new
  #Load output with defaults
  output = {
    "-i" => "127.0.0.1",
    "-p" => 80,
    "-v" => "basic",
    "-h" => false
  }

  
  #Parse inputs into output
  while 1 < input.size() do
    flag = input.shift
    
    if flag == "-i" then
      output["-i"] = input.shift
    elsif flag == "-p" then
      output["-p"] = input.shift
    elsif flag == "-v" then
      output["-v"] = input.shift
    elsif flag == "-h" then
      output["-h"] = true
    else
      puts "Flag: #{flag}, is not understood, and will be ignored."
    end
  end

  return output
end
def printHelp()
  puts "Thank you for using HTTP2 Off The Rails. The following are legal flags:
  Usage: http2otr [-i ip_address] [-p port] [-v off|basic|debug default=basic]
  
  -i, any IPv4 or IPv6 address that you want clients to connect to
  -p, port to receive traffic on
  -v, log levels: off=no output, basic=STDOUT, debug=STDOUT & STDERR"
  exit 0
end

#MAIN
main(ARGV)