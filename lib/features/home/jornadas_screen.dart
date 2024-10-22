import 'package:flutter/material.dart';
import 'package:siven_app/widgets/jornada_card.dart'; // Importación de tu widget JornadaCard

class JornadasScreen extends StatefulWidget {
  @override
  _JornadasScreenState createState() => _JornadasScreenState();
}

class _JornadasScreenState extends State<JornadasScreen> {
  DateTime _selectedDay = DateTime.now();
  
  // Datos estáticos de jornadas
  List<Map<String, dynamic>> jornadas = [
    {
      'date': DateTime(2024, 10, 17),
      'numeroCasos': 40,
      'responsables': ['Lic. Ana Perez (SILAIS - León)', 'Lic. Mario Lopez (SILAIS - León)'],
      'ubicacion': 'León, Nicaragua',
      'fechaInicio': '17/10/2024',
      'fechaFin': '22/10/2024'
    },
    {
      'date': DateTime(2024, 10, 18),
      'numeroCasos': 50,
      'responsables': ['Lic. Carla Mendoza (SILAIS - Granada)', 'Lic. Pedro Gómez (SILAIS - Granada)'],
      'ubicacion': 'Granada, Nicaragua',
      'fechaInicio': '18/10/2024',
      'fechaFin': '24/10/2024'
    },
    {
      'date': DateTime(2024, 10, 19),
      'numeroCasos': 35,
      'responsables': ['Lic. María Gutiérrez (SILAIS - Chontales)', 'Lic. Alberto Fargas (SILAIS - Chontales)'],
      'ubicacion': 'Acoyapa, Chontales',
      'fechaInicio': '14/10/2024',
      'fechaFin': '20/10/2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtener el tamaño de la pantalla

    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),  // Fondo gris claro
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1877F2), size: 32),
            onPressed: () {
              Navigator.pop(context); // Navegación hacia atrás
            },
          ),
        ),
        title: const Text(
          'Gestión de Jornadas',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado
            const Text(
              'Resumen de Jornadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: jornadas.length,
                itemBuilder: (context, index) {
                  final jornada = jornadas[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      width: size.width * 0.95,  // Limitar el ancho a un 95% de la pantalla
                      decoration: BoxDecoration(
                        color: Colors.white,  // Fondo blanco para las tarjetas
                        borderRadius: BorderRadius.circular(12),  // Bordes redondeados
                        border: Border.all(color: Colors.purple, width: 1.5),  // Borde morado
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),  // Desplazamiento de la sombra
                          ),
                        ],
                      ),
                      child: JornadaCard(
                        jornadaNumero: 'Jornada No.${index + 145}', // Número dinámico para las jornadas
                        numeroCasos: jornada['numeroCasos'],
                        ubicacion: jornada['ubicacion'],
                        fechaInicio: jornada['fechaInicio'],
                        fechaFin: jornada['fechaFin'],
                        responsables: jornada['responsables'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
