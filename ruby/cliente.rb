require 'socket'

hostname = 'localhost' #Indicamos el host
port = 2000            #Indicamos el puerto

conexion= TCPSocket.open(hostname, port) #Abrimos la conexion

print "Puede empezar a escribir: "

loop do                 #Comenzamos el loop
    mensaje = gets
    conexion.puts "Cliente dijo: " + mensaje   #Enviamos el mensaje al servidor
    mensaje_servidor = conexion.gets          #Obtenemos el mensaje del servidor
    puts  mensaje_servidor                     #Mostramos el mensaje en consola
    print "Escribir: "
end


#Para correr el programa:
#Correr el archivo servidor.rb primero
#ruby cliente.rb


