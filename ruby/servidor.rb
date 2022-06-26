require 'socket'

server = TCPServer.open(2000)                       #Obtenemos el puerto del servidor

puts "Servidor conectado en el puerto 2000..."
loop {
    Thread.start(server.accept) do |client|         #Conectamos el servidor
        
        mensaje_cliente = client.gets               #Obtenemos el mensaje del cliente
        puts mensaje_cliente                        #Mostramos el mensaje en consola
        
        print "Puede empezar a escribir: "
        var = 0
        while var < 10                              #Creamos el loop infinito
            enviar = gets.chomp
            client.puts "Servidor dijo :" + enviar  #Enviamos el mensaje al cliente
            mensaje_cliente = client.gets           #Obtenemos el mensaje del cliente
            puts mensaje_cliente                    #Mostramos el mensaje del cliente
            print "Escribir: "

        end      
      
    end
}


#Para correr el archivo
#ruby servidor.rb
