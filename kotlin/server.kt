import java.net.ServerSocket
import kotlin.concurrent.thread


fun main()
{
    val puerto = 2000

    val server = ServerSocket(puerto)

    println ("Servidor conectado en el puerto " + puerto.toString() )

    val client = server.accept()
    
   

    
    val clientOutStream = client.getOutputStream()
    val clientInStream = client.getInputStream()

    
    thread {

        
        while(true)
        {
            var nextByte = clientInStream.read()
            print(nextByte.toChar())
            
        }
    }                                               // La ejecución del mismo código permite la conexión (aunque no ideal) de ambos programas

    thread {
        
        while(true)
        {
            
            var input = readLine()!!
            var mensajePred = "Servidor dijo: ".toByteArray()
            clientOutStream.write(mensajePred + input.toByteArray() + 10.toByte())
        }
    }
}


// Primero se compilar
// kotlinc server.kt -include-runtime -d server.jar
// Para correrlo es
// kotlin server.jar