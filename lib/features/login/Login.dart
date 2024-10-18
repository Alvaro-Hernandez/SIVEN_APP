import 'package:flutter/material.dart';
import 'package:siven_app/widgets/version.dart'; // Importa el widget reutilizable
import 'package:siven_app/features/red_de_servicio_screen.dart'; 

void main() {
  runApp(SivenApp());
}

class SivenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/red_servicio': (context) => const RedDeServicioScreen(), // Ruta para red_servicio
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _showPassword = false;
  String _greetingMessage = '';

  @override
  void initState() {
    super.initState();

    // Detectar cuando el campo de contraseña obtiene el foco
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus && _usernameController.text.isNotEmpty) {
        setState(() {
          _greetingMessage = '¡Hola, ${_usernameController.text}!'; // Mensaje de saludo
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/SIVEN-SD.webp',
                        height: 82,
                      ),
                      SizedBox(height: 20),
                      if (_greetingMessage.isNotEmpty)
                        Text(
                          _greetingMessage,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 77, 160, 255),
                          ),
                        ),
                      SizedBox(height: 20),
                      buildCustomTextField(
                        controller: _usernameController,
                        icon: Icons.person,
                        hintText: 'Ingresa tu usuario',
                        focusNode: _usernameFocusNode,
                      ),
                      SizedBox(height: 20),
                      buildCustomTextField(
                        controller: _passwordController,
                        icon: Icons.lock,
                        hintText: 'Ingresa tu contraseña',
                        obscureText: !_showPassword,
                        focusNode: _passwordFocusNode,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {}, // Funcionalidad vacía
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(color: const Color.fromARGB(255, 255, 27, 27)),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navegar a la pantalla 'red_servicio'
                          Navigator.pushNamed(context, '/red_servicio');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 69, 156, 255),
                          foregroundColor: Colors.white,
                          minimumSize: Size(290, 50), // Botón más corto
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        child: Text('SIGUIENTE'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const VersionWidget(), 
        ],
      ),
    );
  }

  Widget buildCustomTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
    FocusNode? focusNode,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Redondeado para todo el contenedor
        border: Border.all(
          color: const Color.fromARGB(255, 77, 160, 255), // Color del borde
          width: 2.0, // Ancho del borde
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50, // Ajustar el ancho del icono
            height: 60, // Mantener el mismo alto que el TextField
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 73, 158, 255), // Fondo del icono
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), // Igualar el redondeado del contenedor principal
                bottomLeft: Radius.circular(10), // Igualar el redondeado del contenedor principal
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: suffixIcon, // Icono de visibilidad
                contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12), // Asegura el redondeado de las esquinas derechas
                    bottomRight: Radius.circular(12),
                  ),
                  borderSide: BorderSide.none, // Sin bordes visibles dentro del TextField
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
