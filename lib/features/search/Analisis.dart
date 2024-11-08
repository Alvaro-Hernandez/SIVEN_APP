import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart'; // Importar widgets reutilizables
import 'package:siven_app/widgets/Version.dart'; // Pie de página reutilizable
import 'package:siven_app/core/services/catalogo_service_red_servicio.dart';
import 'package:siven_app/core/services/selection_storage_service.dart';
import 'package:siven_app/core/services/http_service.dart';
import 'package:http/http.dart' as http;

class AnalisisScreen extends StatefulWidget {
  final List<Map<String, dynamic>> datosFiltrados;

  AnalisisScreen({required this.datosFiltrados});

  @override
  _AnalisisScreenState createState() => _AnalisisScreenState();
}

class _AnalisisScreenState extends State<AnalisisScreen> {
  // Variables para almacenar los resultados del análisis
  int totalCasosRegistrados = 0;
  int totalCasosActivos = 0;
  int totalCasosFinalizados = 0;

  // Datos para los gráficos
  List<ChartData> distribucionLocalidad = [];
  List<IncidenceData> maximosIncidencia = [];
  List<ChartData> distribucionGenero = [];

  // Declaración de servicios
  late CatalogServiceRedServicio catalogService;
  late SelectionStorageService selectionStorageService;

  @override
  void initState() {
    super.initState();

    // Inicializar servicios
    final httpClient = http.Client();
    final httpService = HttpService(httpClient: httpClient);
    catalogService = CatalogServiceRedServicio(httpService: httpService);
    selectionStorageService = SelectionStorageService();

    analizarCaptaciones(widget.datosFiltrados);
  }

  void analizarCaptaciones(List<Map<String, dynamic>> captaciones) {
    // Total de casos registrados
    totalCasosRegistrados = captaciones.length;

    // Total de casos activos y finalizados
    totalCasosActivos = captaciones.where((c) => c['activo'] == 1).length;
    totalCasosFinalizados = totalCasosRegistrados - totalCasosActivos;

    // Análisis para distribución por localidad
    Map<String, int> localidadConteo = {};
    for (var captacion in captaciones) {
      String localidad = captacion['municipio'] ?? 'Desconocido';
      if (localidadConteo.containsKey(localidad)) {
        localidadConteo[localidad] = localidadConteo[localidad]! + 1;
      } else {
        localidadConteo[localidad] = 1;
      }
    }

    // Convertir a porcentaje
    localidadConteo.forEach((localidad, conteo) {
      double porcentaje = (conteo / totalCasosRegistrados) * 100;
      distribucionLocalidad.add(ChartData(localidad, porcentaje, Colors.orange));
    });

    // Análisis para máximos de incidencia (por ejemplo, por día)
    Map<DateTime, int> incidenciaPorDia = {};
    for (var captacion in captaciones) {
      String? fechaStr = captacion['fechaCaptacion'];
      if (fechaStr != null && fechaStr.isNotEmpty) {
        try {
          // Parsear la fecha
          DateTime fecha = DateTime.parse(fechaStr);
          if (incidenciaPorDia.containsKey(fecha)) {
            incidenciaPorDia[fecha] = incidenciaPorDia[fecha]! + 1;
          } else {
            incidenciaPorDia[fecha] = 1;
          }
        } catch (e) {
          // Manejar errores de parseo
          print('Error al parsear la fecha: $fechaStr');
        }
      }
    }

    incidenciaPorDia.forEach((fecha, conteo) {
      maximosIncidencia.add(IncidenceData(fecha, conteo));
    });

    // Ordenar por fecha
    maximosIncidencia.sort((a, b) => a.date.compareTo(b.date));

    // Análisis para distribución por género
    int hombres = captaciones.where((c) => c['genero'] == 'M').length;
    int mujeres = captaciones.where((c) => c['genero'] == 'F').length;

    distribucionGenero = [
      ChartData('Hombres', hombres.toDouble(), Colors.blue),
      ChartData('Mujeres', mujeres.toDouble(), Colors.pink),
    ];

    setState(() {
      // Actualiza el estado para reflejar los resultados
    });
  }

  @override
  Widget build(BuildContext context) {
    // Colores utilizados
    const Color fondoColor = Color(0xFFFBFBFB);
    const Color naranja = Color(0xFFF7941D);
    const Color azulBrillante = Color(0xFF1877F2);

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: azulBrillante, size: 32),
            onPressed: () {
              Navigator.pop(context);
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Uso de los widgets pasando los servicios
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotonCentroSalud(
                        catalogService: catalogService,
                        selectionStorageService: selectionStorageService,
                      ),
                      const IconoPerfil(),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Texto Red de Servicio
                  Center(
                    child: RedDeServicio(
                      catalogService: catalogService,
                      selectionStorageService: selectionStorageService,
                    ),
                  ),
                  SizedBox(height: 32),

                  // Encabezado con el icono naranja de estadísticas
                  Row(
                    children: [
                      Icon(Icons.bar_chart, color: naranja),
                      SizedBox(width: 10),
                      Text(
                        'Análisis de captación',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: naranja,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Fila con 3 Cards para Casos registrados, activos y finalizados
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ResumenCard(
                          bordeColor: naranja,
                          numero: '$totalCasosRegistrados',
                          titulo: 'Casos registrados',
                          numeroColor: naranja,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ResumenCard(
                          bordeColor: Color(0xFFD9006C),
                          numero: '$totalCasosActivos',
                          titulo: 'Casos activos',
                          numeroColor: Color(0xFFD9006C),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ResumenCard(
                          bordeColor: Color(0xFF39B54A),
                          numero: '$totalCasosFinalizados',
                          titulo: 'Casos finalizados',
                          numeroColor: Color(0xFF39B54A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Card para los gráficos de torta con scroll horizontal
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: naranja), // Borde naranja
                    ),
                    color: Colors.white, // Fondo blanco
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Distribución de los casos por localidad',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: naranja, // Título color naranja
                            ),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: distribucionLocalidad.map((data) {
                                return Container(
                                  width: 200, // Ancho fijo para cada gráfico
                                  child: PieChartCard(
                                    localidad: data.label,
                                    porcentaje: data.value,
                                    color: data.color,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Gráfico de Máximos de incidencia con scroll horizontal
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: naranja), // Borde naranja
                    ),
                    color: Colors.white, // Fondo blanco
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Máximos de incidencia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: naranja, // Título color naranja
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 300, // Gráfico más alto
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                width: maximosIncidencia.length * 80, // Ajustar el ancho según la cantidad de datos
                                child: SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(),
                                  series: <ChartSeries<IncidenceData, DateTime>>[
                                    SplineAreaSeries<IncidenceData, DateTime>(
                                      dataSource: maximosIncidencia,
                                      xValueMapper: (IncidenceData data, _) => data.date,
                                      yValueMapper: (IncidenceData data, _) => data.count.toDouble(),
                                      color: naranja.withOpacity(0.5),
                                      borderColor: naranja,
                                      borderWidth: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Gráfico de Distribución por género
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: naranja), // Borde naranja
                    ),
                    color: Colors.white, // Fondo blanco
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Distribución por género',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: naranja, // Título color naranja
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 300, // Gráfico más alto
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: <ColumnSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                  dataSource: distribucionGenero,
                                  xValueMapper: (ChartData data, _) => data.label,
                                  yValueMapper: (ChartData data, _) => data.value,
                                  pointColorMapper: (ChartData data, _) => data.color,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VersionWidget(), // Pie de página con la versión
        ],
      ),
    );
  }
}

// Widget personalizado para gráficos de torta en la card
class PieChartCard extends StatelessWidget {
  final String localidad;
  final double porcentaje;
  final Color color;

  PieChartCard({
    required this.localidad,
    required this.porcentaje,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: SfCircularChart(
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: [
                  ChartData(localidad, porcentaje, color),
                  ChartData('Resto', 100 - porcentaje, Colors.grey[200]!),
                ],
                xValueMapper: (ChartData data, _) => data.label,
                yValueMapper: (ChartData data, _) => data.value,
                pointColorMapper: (ChartData data, _) => data.color,
                dataLabelMapper: (ChartData data, _) => '${data.value.toStringAsFixed(1)}%',
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  labelPosition: ChartDataLabelPosition.outside,
                ),
              ),
            ],
          ),
        ),
        Text(localidad),
      ],
    );
  }
}

// Widget personalizado para los bloques de resumen
class ResumenCard extends StatelessWidget {
  final Color bordeColor;
  final String numero;
  final String titulo;
  final Color numeroColor;

  ResumenCard({
    required this.bordeColor,
    required this.numero,
    required this.titulo,
    required this.numeroColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordeColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numero,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: numeroColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            titulo,
            style: TextStyle(
              fontSize: 14,
              color: bordeColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Clase para los datos del gráfico de incidencia
class IncidenceData {
  final DateTime date;
  final int count;

  IncidenceData(this.date, this.count);
}

// Clase para los datos del gráfico general
class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}
