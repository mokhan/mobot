require "socket"

module Mobot
  class Client
    SOCKET_FILE = '/tmp/mobot.sock'
    def self.run(command = ARGV[0])
      socket = UNIXSocket.new(SOCKET_FILE)
      socket.write(command)
      socket.close_write
      puts socket.read
    end
  end
end
