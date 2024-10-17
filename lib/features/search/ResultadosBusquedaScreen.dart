import 'package:flutter/material.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart';
import 'package:siven_app/widgets/Version.dart'; // Importa el nuevo widget de versión
import 'package:flutter/rendering.dart';

class ResultadosBusquedaScreen extends StatefulWidget {
  const ResultadosBusquedaScreen({Key? key}) : super(key: key);

  @override
  _ResultadosBusquedaScreenState createState() => _ResultadosBusquedaScreenState();
}

class _ResultadosBusquedaScreenState extends State<ResultadosBusquedaScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeader = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <= 0) {
        if (!_showHeader) {
          setState(() {
            _showHeader = true; // Mostrar encabezado
          });
        }
      } else if (_scrollController.position.pixels > 100) {
        if (_showHeader) {
          setState(() {
            _showHeader = false; // Ocultar encabezado
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color azulBrillante = Color(0xFF1877F2);
    const Color grisOscuro = Color(0xFF4A4A4A);
    const Color naranja = Color(0xFFF7941D);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 90), // Espacio para el encabezado fijo

                      // Botón Centro de Salud y Perfil de Usuario
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BotonCentroSalud(),
                          IconoPerfil(),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Texto Red de Servicio
                      const RedDeServicio(),
                      const SizedBox(height: 30), // Reduje el espacio

                      // Texto e Ícono "Resultado de búsqueda"
                      Row(
                        children: const [
                          Icon(Icons.search, color: naranja, size: 26), // Ícono más grande
                          SizedBox(width: 8),
                          Text(
                            'Resultado de búsqueda',
                            style: TextStyle(
                              fontSize: 18,
                              color: naranja,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Campo de Filtro con ícono de filtro a la izquierda
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.filter_list, size: 24, color: grisOscuro), // Ícono más grande
                                hintText: 'Filtro por datos de la persona',
                                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: naranja, // Bordes color naranja
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: naranja,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: naranja,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Reduje el espacio

                      // Botones "Generar Reporte de Esta Lista" y "Generar Análisis de Esta Lista" con íconos y fondo blanco
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Acción para generar reporte (vacía)
                              },
                              icon: const Icon(Icons.article, color: naranja, size: 40), // Ícono más grande
                              label: const Text(
                                'Generar Reporte de Esta Lista',
                                style: TextStyle(color: naranja),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Fondo blanco
                                side: const BorderSide(color: naranja), // Borde color naranja
                                padding: const EdgeInsets.symmetric(vertical: 10), // Altura reducida
                                minimumSize: const Size(150, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Espacio entre los botones
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Acción para generar análisis (vacía)
                              },
                              icon: const Icon(Icons.analytics, color: naranja, size: 40), // Ícono más grande
                              label: const Text(
                                'Generar Análisis de Esta Lista',
                                style: TextStyle(color: naranja),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Fondo blanco
                                side: const BorderSide(color: naranja), // Borde color naranja
                                padding: const EdgeInsets.symmetric(vertical: 10), // Altura reducida
                                minimumSize: const Size(150, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 0), // Eliminado el espacio extra

                      // Listado de resultados (cards)
                      ListView.builder(
                        shrinkWrap: true, // Para que la lista ocupe solo el espacio necesario
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10, // Se agregaron más registros
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white, // Fondo blanco de la card
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: naranja, // Bordes color naranja
                                width: 1.0,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8), // Reducido el margen vertical
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Aumenta el padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Identificación: 00107095700${index}3H',
                                    style: const TextStyle(
                                      color: grisOscuro,
                                      fontSize: 14, // Texto color gris oscuro
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Código expediente: 408EUBRM0705850${index}',
                                    style: const TextStyle(
                                      color: grisOscuro,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Nombre completo: Persona ${index + 1}',
                                    style: const TextStyle(
                                      color: grisOscuro,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Municipio/Departamento: Juigalpa/Chontales',
                                    style: TextStyle(
                                      color: grisOscuro,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Botón Generar Reporte en cada card (más ancho y sin icono)
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Acción para generar reporte individual (vacía)
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: naranja,
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        minimumSize: const Size(300, 40), // Botón más ancho
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Generar Reporte',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Siempre muestra el widget de versión en la parte inferior de la pantalla
              const VersionWidget(),
            ],
          ),
          // Encabezado fijo, se oculta cuando se hace scroll hacia abajo, y se muestra al volver al tope
          if (_showHeader)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: azulBrillante, size: 32),
                          onPressed: () {
                            // Navegación a la pantalla FiltrarReporte
                            Navigator.pushNamed(context, '/FiltrarReporte');
                          },
                        ),
                      ),
                      title: const EncabezadoBienvenida(),
                      centerTitle: true,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
