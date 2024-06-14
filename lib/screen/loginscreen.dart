import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/screen/cuentascreen.dart';
import 'package:prueba_02/screen/historialscreen.dart';

void main() {
  runApp(Login(
    nombreEstudiante: 'Your Student Name', // Replace with actual name
    usuarioGithub: 'Your GitHub Username', // Replace with actual username
  ));
}

class Login extends StatelessWidget {
  const Login({super.key, required String nombreEstudiante, required String usuarioGithub});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Set the background image here
        body: Stack(
          children: <Widget>[
            // Container with background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg'), // Replace with your image path
                  fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
                ),
              ),
            ),
            // Rest of your app content goes here (Home widget)
            Home(),
          ],
        ),
      ),
    );
  }
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
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
         const Text("LOGIN"),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonLogin(context)
        ],
      )
      
    ),
  );
}

final TextEditingController _correo = TextEditingController();

Widget CampoCorreo(context){
  return(
    TextField(
      controller: _correo,
    decoration: InputDecoration(
      hintText: "Ingrese Correo"),
  )

  );
}
final TextEditingController _contrasenia = TextEditingController();
Widget CampoContrasenia(context){
   return(
    TextField(
      controller: _contrasenia,
    decoration: InputDecoration(
      hintText: "Ingrese Contraseña"
      ),
  )

  );
}
Widget BotonLogin(context){
  return(
      FilledButton(onPressed: (){
        login(context);
      }, 
      child: Text("Login"))
  );

}

Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,password: _contrasenia.text);
//////////////////////////////////////////////////
Navigator.push(
          context,MaterialPageRoute(builder: (context) => Historial()));

////////////////////////////////////////////////


} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}

