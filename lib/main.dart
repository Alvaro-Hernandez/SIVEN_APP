import 'package:flutter/material.dart';
import 'features/login/Login.dart';
import 'features/home/Home.dart';
import 'features/red_de_servicio_screen.dart';
import 'features/search/search_screen.dart';
import 'features/search/ResultadosBusquedaScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIVEN App',
      initialRoute: '/login', // Ruta inicial por defecto
      routes: {
        '/login': (context) => LoginScreen(), // Quitamos 'const'
        '/home': (context) => Home(), // Quitamos 'const'
        '/FiltrarReporte': (context) => SearchScreen(), // Quitamos 'const'
        '/red_servicio': (context) => RedDeServicioScreen(), // Quitamos 'const'
        '/resultados_busqueda': (context) => ResultadosBusquedaScreen(), // Quitamos 'const'
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Ruta no encontrada: ${settings.name}'),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
