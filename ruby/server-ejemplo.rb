
require 'socket'

server = TCPServer.open(2000)

puts "Servidor corriendo en el puerto 2000..."

while true
    connection = server.accept
    Thread.new(connection) do |client|

        client.print "Como te llamas? "
        name = client.gets.chomp
        client.puts "Bienvendio #{name}"
        client.close
    end

end