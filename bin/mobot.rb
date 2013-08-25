#!/usr/bin/env ruby
require "socket"

SOCKET_FILE = '/tmp/mobot.sock'
command = ARGV[0]
socket = UNIXSocket.new(SOCKET_FILE)
socket.write(command)
socket.close_write
puts socket.read
