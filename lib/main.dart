
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/screen/cuentascreen.dart';
import 'package:prueba_02/screen/historialscreen.dart';
import 'package:prueba_02/screen/loginscreen.dart';
import 'package:prueba_02/screen/pruebascreen.dart';
import 'package:prueba_02/screen/registroscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define a custom theme for consistent styling
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Adjust colors as desired
        primaryColor: Colors.deepPurple[800],
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50), // Set minimum button size
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16.0), // Adjust text size
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1; // Use an underscore for private variables

 // Your existing content widget
 // Your widget for Ventana 01
   // Your widget for Ventana 02


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ELECTRODOMESTICOS MICHAEL",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.blue,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Cuerpo(context), // Place your existing content on top of the image (optional)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the state with the selected index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: "Cuenta",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tsunami), // Consider a more descriptive icon
            label: "historial",
          ),
        
        ],
      ),
    );
  }
}



Widget Cuerpo(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
    children: <Widget>[
      Text(
        "Welcome",
        style: TextStyle(
          fontSize: 24.0, // Adjust font size as desired
          color: Colors.blue, // Set a vibrant blue color
          fontFamily: 'Roboto', // Use a custom font (optional)
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      
      const SizedBox(height: 20.0,), // Add spacing between elements
      BotonLogin(context),
      const SizedBox(height: 10.0), // Add smaller spacing
      BotonRegistro(context),
      const SizedBox(height: 10.0), // Add smaller spacing
       BotonPrueba(context),
      const SizedBox(height: 10.0),
       BotonHistorial(context),
      const SizedBox(height: 10.0)
      
   
    ],
  );
}


Widget BotonLogin(context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
 // Light purple color
    ),
    onPressed: () {
      // Assuming you have a way to retrieve nombreEstudiante and usuarioGithub values
      final nombreEstudiante = 'Enter your name here'; // Replace with your logic
      final usuarioGithub = 'Enter your GitHub username here'; // Replace with your logic
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(
            nombreEstudiante: nombreEstudiante,
            usuarioGithub: usuarioGithub,
          ),
        ),
      );
    },
    child: Text(
      "Login",
      style: TextStyle(
        color: Color.fromARGB(255, 216, 104, 231), // White text for better contrast
      ),
    ),
  );
}


Widget BotonRegistro(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    child: const Text("Registro"),
  );
}


Widget BotonPrueba(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Prueba()),
      );
    },
    child: const Text("Prueba"),
  );
}

Widget Botoncuentas(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cuenta()),
      );
    },
    child: const Text("Cuenta"),
  );
}



Widget BotonHistorial(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Historial()),
      );
    },
    child: const Text("Historial"),
  );
}

