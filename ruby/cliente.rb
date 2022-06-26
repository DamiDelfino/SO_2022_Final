require 'socket'

hostname = 'localhost' #Indicamos el host
port = 2000            #Indicamos el puerto

coneccion= TCPSocket.open(hostname, port)


loop do
    mensaje = gets
    coneccion.puts mensaje
    mensaje_servidor = coneccion.gets
    puts mensaje_servidor
end




