import java.net.Socket
import kotlin.concurrent.thread

fun main()
{
    val client = Socket("localhost", 2000)

    val clientOutStream = client.getOutputStream()
    val clientInStream = client.getInputStream()

    thread {
        while(true)                                     // Creamos un loop para leer los datos del servidor e imprimirlos en consola
        {
            var nextByte = clientInStream.read()    
            print(nextByte.toChar())
        }
    }

    thread {
        while(true)                                      // Creamos un loop en el cual escribimos nuestro mensaje al servidor
        {
            var input = readLine()!!               
            var mensajePred = "Cliente dijo: ".toByteArray()
            clientOutStream.write(mensajePred + input.toByteArray() + 10.toByte())
        }
    }
}
// Primero se compilar
// kotlinc cliente.kt -include-runtime -d cliente.jar
// Para correrlo es
// kotlin cliente.jar