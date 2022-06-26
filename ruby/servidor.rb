require 'socket'

server = TCPServer.open(2000)

puts "Servidor conectado en el puerto 2000..."
loop {
    Thread.start(server.accept) do |client|
        
        mensaje_cliente = client.gets
        puts mensaje_cliente
        
        print "Puede empezar a escribir: "
        var = 0
        while var < 10
            enviar = gets.chomp
            client.puts "servidor dijo :" + enviar
            mensaje_cliente = client.gets
            puts mensaje_cliente

        end      
      
    end
}

