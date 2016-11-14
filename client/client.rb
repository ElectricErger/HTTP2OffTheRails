#!/usr/bin/ruby
require "socket"

s = TCPSocket.new('127.0.0.1', 80)
s.close
