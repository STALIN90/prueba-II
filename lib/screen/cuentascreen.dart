import 'package:flutter/material.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Contenedor para la imagen de usuario
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset('assets/images/user_image.png'),
                ),
              ),
              const SizedBox(height: 16.0),

              // Número de cuenta
              Text(
                'Número de cuenta: 1234567890', // Reemplazar con número real
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 16.0),

              // Valor total de la cuenta
              Text(
                'Valor total: \$10,000.00', // Reemplazar con valor real
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32.0),

              // Botón para copiar número de cuenta
              ElevatedButton(
                onPressed: () {
                  // Implementar la función para copiar el número de cuenta
                  // https://datogedon.com/sdks/flutter/copiar-o-pegar-texto-desde-el-portapapeles-con-dart-en-flutter/
                },
                child: const Text('Copiar número de cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
