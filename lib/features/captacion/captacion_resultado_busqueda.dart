import 'package:flutter/material.dart';
import 'package:siven_app/widgets/version.dart'; // Widget reutilizado
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart'; // Widget reutilizado
import 'package:siven_app/widgets/card_persona.dart'; // Widget CardPersonaWidget reutilizado
import 'package:siven_app/widgets/filtro_persona.dart'; // Widget FiltroPersonaWidget reutilizado 

class CaptacionResultadoBusqueda extends StatelessWidget {
  const CaptacionResultadoBusqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, '/captacion_busqueda_por_nombre');
            },
          ),
        ),
        title: const EncabezadoBienvenida(), // Reutilizando el encabezado
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
                  // Filas con botones adicionales (BotonCentroSalud y IconoPerfil)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BotonCentroSalud(),
                      IconoPerfil(),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Red de servicio (otro widget adicional)
                  const RedDeServicio(),
                  const SizedBox(height: 30),

                  // Filtro por datos de la persona
                  const FiltroPersonaWidget(
                    hintText: 'Filtrar por datos de la persona',
                    colorBorde: Color(0xFF00BCD4), // Color turquesa personalizado
                    colorIcono: Color(0xFF00BCD4), // Color del icono turquesa
                    colorTexto: Color(0xFF4A4A4A), // Color del texto
                  ),
                  const SizedBox(height: 20),

                 // Lista de resultados de búsqueda usando CardPersonaWidget
                  Column(
                    children: [
                      CardPersonaWidget(
                        identificacion: '001023459876H',
                        expediente: '232HJULI07056876',
                        nombre: 'Álvaro Benites Hernández',
                        ubicacion: 'Juigalpa/Chontales',
                        colorBorde: const Color(0xFF00BCD4), // Color del borde turquesa
                        colorBoton: const Color(0xFF00BCD4), // Botón con fondo turquesa
                        textoBoton: 'SELECCIONAR', // Texto personalizado del botón
                        onBotonPressed: () {
                          // Acción del botón
                        },
                      ),
                      const SizedBox(height: 10), // Espaciado entre las tarjetas
                      CardPersonaWidget(
                        identificacion: '010245896712H',
                        expediente: '587AJULIO6051232',
                        nombre: 'Álvaro Martín Benites López',
                        ubicacion: 'Masaya/Masaya',
                        colorBorde: const Color(0xFF00BCD4), // Color del borde turquesa
                        colorBoton: const Color(0xFF00BCD4), // Botón con fondo turquesa
                        textoBoton: 'SELECCIONAR',
                        onBotonPressed: () {
                          // Acción del botón
                        },
                      ),
                      const SizedBox(height: 10), // Espaciado entre las tarjetas
                      CardPersonaWidget(
                        identificacion: '024106905612H',
                        expediente: '573MASIN60781234',
                        nombre: 'Álvaro Benites Pérez',
                        ubicacion: 'Catarina/Masaya',
                        colorBorde: const Color(0xFF00BCD4), // Color del borde turquesa
                        colorBoton: const Color(0xFF00BCD4), // Botón con fondo turquesa
                        textoBoton: 'SELECCIONAR',
                        onBotonPressed: () {
                          // Acción del botón
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const VersionWidget(), // Widget de la versión en la parte inferior
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CaptacionResultadoBusqueda(),
  ));
}