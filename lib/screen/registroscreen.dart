import 'package:flutter/material.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class User {
  final String nickname;
  final String email;
  final String password;

  User({required this.nickname, required this.email, required this.password});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Stack(
        children: [
          // Background image container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg"), // Replace with your image URL
                fit: BoxFit.cover, // Adjust as needed (cover, contain, etc.)
              ),
            ),
          ),
          // Content of the screen with padding
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Center vertically
                children: <Widget>[
                  Text("REGISTRO"),
                  CampoCorreo(context),
                  CampoContrasenia(context),
                  BotonLogin(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final TextEditingController _correo = TextEditingController();

Widget CampoCorreo(context) {
  return TextField(
    controller: _correo,
    decoration: InputDecoration(hintText: "Ingrese Correo"),
  );
}

final TextEditingController _contrasenia = TextEditingController();

Widget CampoContrasenia(context) {
  return TextField(
    controller: _contrasenia,
    decoration: InputDecoration(hintText: "Ingrese Contraseña"),
  );
}

Widget BotonLogin(context) {
  return ElevatedButton(
    onPressed: () {
      // Implement login functionality
    },
    child: Text("Login"),
  );
}
