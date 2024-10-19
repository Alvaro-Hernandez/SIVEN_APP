import 'package:flutter/material.dart';
import 'package:siven_app/widgets/version.dart'; // Widget reutilizado
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart'; // Widget reutilizado

class BusquedaPorNombreScreen extends StatelessWidget {
  const BusquedaPorNombreScreen({Key? key}) : super(key: key);

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
              Navigator.pushNamed(context, '/captacion_busqeda_persona');
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

                  // Título "Búsqueda por nombre" con ícono de lupa
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.search, color: Color(0xFF00BCD4)),
                      SizedBox(width: 10),
                      Text(
                        'Búsqueda por nombre',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF00BCD4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Campos de texto (2x2 grid)
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Primer nombre*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Primer apellido*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Segundo nombre',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Segundo apellido',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Texto informativo
                  const Text(
                    'Los campos marcados con * son requeridos',
                    style: TextStyle(color: Color(0xFFBDC3C7)),
                  ),
                  const SizedBox(height: 30),

                  // Botón Buscar reutilizado
                  ElevatedButton(
                    onPressed: () {
                      // Navegación a captacion_resultado_busqueda
                      Navigator.pushNamed(context, '/captacion_resultado_busqueda');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      backgroundColor: const Color(0xFF00BCD4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'BUSCAR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
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
    home: BusquedaPorNombreScreen(),
  ));
}
