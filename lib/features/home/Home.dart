// lib/screens/home.dart

import 'package:flutter/material.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart';
import 'package:siven_app/widgets/custom_card.dart'; // Asegúrate que esta ruta sea correcta
import 'package:siven_app/widgets/version.dart'; // Importa el widget reutilizable

class Home extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      text: "REGISTRO Y SEGUIMIENTO DE DATOS EPIDEMIOLÓGICOS",
      iconPath: 'lib/assets/homeicon/icono-registro.webp',
      backgroundColor: Color(0xFF00BFFF),
    ),
    CardItem(
      text: "ALERTAS TEMPRANAS",
      iconPath: 'lib/assets/homeicon/alerta-_1_-2.webp',
      backgroundColor: Color(0xFFFF69B4),
    ),
    CardItem(
      text: "GESTIÓN DE JORNADAS DE VIGILANCIA EPIDEMIOLÓGICA",
      iconPath: 'lib/assets/homeicon/equipo-medico-_4_-1.webp',
      backgroundColor: Color(0xFF9C27B0),
    ),
    CardItem(
      text: "REGISTRO EPIDEMIOLÓGICO A NIVEL ESCOLAR",
      iconPath: 'lib/assets/homeicon/estudio-1.webp',
      backgroundColor: Color(0xFF1E90FF),
    ),
    CardItem(
      text: "REPORTES Y ANÁLISIS",
      iconPath: 'lib/assets/homeicon/analitica-1.webp',
      backgroundColor: Color(0xFFFFA500),
    ),
    CardItem(
      text: "GESTIÓN DE USUARIO Y PARAMETRIZACIÓN",
      iconPath: 'lib/assets/homeicon/configuracion-2.webp',
      backgroundColor: Color(0xFF32CD32),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1877F2), size: 32),
            onPressed: () {
              // Navega a la pantalla red_servicio
              Navigator.pushNamed(context, '/red_servicio');
            },
          ),
        ),
        title: const EncabezadoBienvenida(),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BotonCentroSalud(),
                      IconoPerfil(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const RedDeServicio(),
                  const SizedBox(height: 20),

                  // Lista de tarjetas
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cardItems.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        item: cardItems[index],
                        screenHeight: screenSize.height,
                        onTap: () {
                          // Navegación específica para "REPORTES Y ANÁLISIS"
                          if (cardItems[index].text == "REPORTES Y ANÁLISIS") {
                            Navigator.pushNamed(context, '/FiltrarReporte');
                          }
                          // Navegación específica para "ALERTAS TEMPRANAS"
                          else if (cardItems[index].text == "ALERTAS TEMPRANAS") {
                            Navigator.pushNamed(context, '/alerta_temprana');
                          }
                          // Puedes agregar más condiciones para otras tarjetas si lo deseas
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const VersionWidget(), // Widget de versión en la parte inferior
        ],
      ),
    );
  }
}
