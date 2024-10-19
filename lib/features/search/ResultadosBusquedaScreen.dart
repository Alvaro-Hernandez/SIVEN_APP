import 'package:flutter/material.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart';
import 'package:siven_app/widgets/Version.dart';
import 'package:siven_app/widgets/card_persona.dart'; // Importa el widget reutilizable para las cards
import 'package:flutter/rendering.dart';
import 'package:siven_app/widgets/filtro_persona.dart'; 

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
                      const SizedBox(height: 30),

                      // Texto e Ícono "Resultado de búsqueda"
                      Row(
                        children: const [
                          Icon(Icons.search, color: naranja, size: 26),
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

                      // Llamada al Widget Reutilizable FiltroPersonaWidget
                      Row(
                        children: [
                          Expanded(
                            child: FiltroPersonaWidget(
                              hintText: 'Filtro por datos de la persona',
                              colorBorde: naranja,
                              colorIcono: grisOscuro,
                              colorTexto: grisOscuro,
                              onChanged: (valor) {
                                print('Texto ingresado: $valor');
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Botones "Generar Reporte de Esta Lista" y "Generar Análisis de Esta Lista"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Acción para generar reporte
                              },
                              icon: const Icon(Icons.article, color: naranja, size: 40),
                              label: const Text(
                                'Generar Reporte de Esta Lista',
                                style: TextStyle(color: naranja),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: naranja),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                minimumSize: const Size(150, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Navegación a la pantalla de análisis
                                Navigator.pushNamed(context, '/analisis');
                              },
                              icon: const Icon(Icons.analytics, color: naranja, size: 40),
                              label: const Text(
                                'Generar Análisis de Esta Lista',
                                style: TextStyle(color: naranja),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: naranja),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                minimumSize: const Size(150, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 0),

                      // Listado de resultados (cards reutilizables)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10, // Simulando 10 resultados
                        itemBuilder: (context, index) {
                          return CardPersonaWidget(
                            identificacion: '00107095700${index}3H',
                            expediente: '408EUBRM0705850${index}',
                            nombre: 'Persona ${index + 1}',
                            ubicacion: 'Juigalpa/Chontales',
                            colorBorde: naranja,
                            colorBoton: naranja,
                            textoBoton: 'Generar Reporte', // Puedes cambiarlo si lo necesitas
                            onBotonPressed: () {
                              // Acción al presionar el botón
                              print('Generando reporte para Persona ${index + 1}');
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const VersionWidget(),
            ],
          ),
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