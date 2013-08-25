require "socket"

module Mobot
  class Server
    SOCKET_FILE = '/tmp/mobot.sock'
    def self.start
      lock_file = File.open('/tmp/mobot.lock', 'w')

      if lock_file.flock(File::LOCK_EX | File::LOCK_NB)
        server = UNIXServer.new(SOCKET_FILE)

        parent_process_id = Process.pid
        at_exit do
          File.unlink(SOCKET_FILE) if Process.pid == parent_process_id
        end

        trap(:INT) { exit }

        puts "mobot reporting for duty"

        loop do
          client = server.accept
          command = client.read

          pid = fork do
            $stdout.reopen(client)
            puts "mobot received command: #{command}"
            begin
              exec(command)
            rescue Exception => e
              puts "something very bad happended. #{e.message}"
            end
          end

          Process.wait(pid)
          client.close
        end
      else
        # exit
        p "there can only be one. bye bye."
      end
    end
  end
end
