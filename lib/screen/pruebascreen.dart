import 'package:flutter/material.dart';
import 'package:prueba_02/screen/loginscreen.dart'; // Importar la ventana de login

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(backgroundImage: 'https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg'), // Replace with your image URL
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String backgroundImage;

  const MyHomePage({super.key, required this.backgroundImage});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nombreEstudianteController = TextEditingController();
  final _usuarioGithubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Stack( // Use Stack to position image behind content
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.backgroundImage),
                fit: BoxFit.cover, // Adjust fit as needed
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nombreEstudianteController,
                  decoration: const InputDecoration(hintText: 'Nombre del estudiante'),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _usuarioGithubController,
                  decoration: const InputDecoration(hintText: 'Usuario de GitHub'),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    final nombreEstudiante = _nombreEstudianteController.text;
                    final usuarioGithub = _usuarioGithubController.text;

                    if (nombreEstudiante.isEmpty || usuarioGithub.isEmpty) {
                      // Mostrar error si algún campo está vacío
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Completa todos los campos'),
                        ),
                      );
                      return;
                    }

                    // Redireccionar a la ventana de login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login(nombreEstudiante: nombreEstudiante, usuarioGithub: usuarioGithub)),
                    );
                  },
                  child: const Text('Ir a Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
