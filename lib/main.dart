import 'package:flutter/material.dart';
import 'features/login/Login.dart';
import 'features/home/Home.dart';
import 'features/red_de_servicio_screen.dart';
import 'features/search/search_screen.dart';
import 'features/search/ResultadosBusquedaScreen.dart';
import 'features/search/Analisis.dart';
import 'features/Notificationsearch/alerta_temprana.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIVEN App',
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginScreen(), 
        '/home': (context) => Home(),
        '/FiltrarReporte': (context) => SearchScreen(), 
        '/red_servicio': (context) => RedDeServicioScreen(), 
        '/resultados_busqueda': (context) => ResultadosBusquedaScreen(), 
        '/analisis': (context) => AnalisisApp(),
        '/alerta_temprana': (context) => AlertaTemprana(),
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
