import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:siven_app/widgets/version.dart'; // Widget reutilizado
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart'; // Widget reutilizado

class AlertaTemprana extends StatefulWidget {
  const AlertaTemprana({Key? key}) : super(key: key);

  @override
  _AlertaTempranaState createState() => _AlertaTempranaState();
}

class _AlertaTempranaState extends State<AlertaTemprana> {
  // Controladores para los Dropdowns
  String selectedRegion = "Managua";
  String selectedPeriodo = "Enero";
  String selectedEpidemia = "Dengue";

  // Datos de prueba para los dropdowns
  final List<String> regiones = [
    "Managua",
    "RAAN",
    "Chinandega",
    "Boaco",
    "Masaya",
    "León",
    "Granada",
    "Carazo",
    "Rivas",
    "Matagalpa"
  ];

  final List<String> periodos = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre"
  ];

  final List<String> epidemias = [
    "Dengue",
    "Influenza",
    "Malaria",
    "Covid-19",
    "Chikungunya",
    "Zika",
    "Hepatitis",
    "Tifoidea",
    "Colera",
    "Ébola"
  ];

  // Función para actualizar los datos de los gráficos
  List<ChartData> _getChartData() {
    if (selectedRegion == "Managua" && selectedPeriodo == "Enero") {
      return [
        ChartData(1, 30),
        ChartData(2, 40),
        ChartData(3, 35),
        ChartData(4, 50),
        ChartData(5, 45),
      ];
    } else if (selectedRegion == "RAAN" && selectedPeriodo == "Febrero") {
      return [
        ChartData(1, 20),
        ChartData(2, 35),
        ChartData(3, 50),
        ChartData(4, 40),
        ChartData(5, 25),
      ];
    } else {
      return [
        ChartData(1, 50),
        ChartData(2, 60),
        ChartData(3, 70),
        ChartData(4, 55),
        ChartData(5, 65),
      ];
    }
  }

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
            icon: const Icon(Icons.arrow_back,
                color: Color(0xFF1877F2), size: 32),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
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

                  // Contenedor de "Alertas tempranas"
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFD9006C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Alertas tempranas",
                              style: TextStyle(
                                color: Color(0xFFD9006C),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Icon(
                              Icons.warning,
                              color: Color(0xFFD9006C),
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "5 alertas nuevas en Chinandega   Alta prioridad",
                          style: TextStyle(
                            color: Color(0xFFD9006C),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "3 alertas nuevas en Boaco   Mediana prioridad",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Filtros: Región, Período, Epidemia
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dropdown de Región
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedRegion,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRegion = newValue!;
                            });
                          },
                          items: regiones.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Dropdown de Período
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedPeriodo,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedPeriodo = newValue!;
                            });
                          },
                          items: periodos.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Dropdown de Epidemia
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedEpidemia,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedEpidemia = newValue!;
                            });
                          },
                          items: epidemias.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Gráfico de líneas con scroll horizontal
                  Container(
                    height: 300,  // Aumentamos el tamaño del gráfico
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD9006C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 600, // Ancho suficiente para hacer scroll
                        child: SfCartesianChart(
                          title: ChartTitle(text: 'Incidencias de enfermedades'),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.bottom, // Mover la leyenda abajo
                          ),
                          series: <ChartSeries>[
                            LineSeries<ChartData, int>(
                              name: 'Dengue',
                              color: Color(0xFFC2185B),
                              dataSource: _getChartData(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                            ),
                            LineSeries<ChartData, int>(
                              name: 'Influenza',
                              color: Color(0xFFF48FB1),
                              dataSource: _getChartData(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                            ),
                            LineSeries<ChartData, int>(
                              name: 'Malaria',
                              color: Color(0xFFD9006C),
                              dataSource: _getChartData(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Primera tarjeta: Distribución de los casos
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9006C), width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Distribución de los casos",
                          style: TextStyle(
                            color: Color(0xFFD9006C),
                            fontSize: 16, // Reducimos el tamaño de la tipografía
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 10), // Reducimos el espacio
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: _buildCircularChart(context, "Managua", 29)),
                            Expanded(child: _buildCircularChart(context, "RAAN", 25)),
                            Expanded(child: _buildCircularChart(context, "Chinandega", 23)),
                            Expanded(child: _buildCircularChart(context, "Boaco", 21)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Segunda tarjeta: Gráfico de barras
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9006C), width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "203.482% de Afectación",
                          style: TextStyle(
                            color: Color(0xFFD9006C),
                            fontSize: 20, // Reducimos el tamaño de la tipografía
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 10),
                        SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            ColumnSeries<BarChartData, String>(
                              dataSource: _getBarChartData(),
                              xValueMapper: (BarChartData data, _) => data.category,
                              yValueMapper: (BarChartData data, _) => data.value,
                              color: Color(0xFFD9006C),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Apartado del mapa (mantener para el futuro)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFD9006C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Aquí se muestra el mapa con la incidencia",
                        style: TextStyle(
                          color: Color(0xFF4A4A4A),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                        ),
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

  // Función para los gráficos circulares
  Widget _buildCircularChart(BuildContext context, String label, double percentage) {
    return Column(
      children: [
        SizedBox(
          height: 80, // Ajustamos el tamaño de los gráficos circulares
          child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<_PieData, String>(
                dataSource: [
                  _PieData(label, percentage),
                  _PieData("Restante", 100 - percentage),
                ],
                pointColorMapper: (_PieData data, _) =>
                    data.y == percentage ? Color(0xFFD9006C) : Color(0xFFe0e0e0),
                xValueMapper: (_PieData data, _) => data.x,
                yValueMapper: (_PieData data, _) => data.y,
                innerRadius: '70%',
              ),
            ],
          ),
        ),
        Text(
          "$label",
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "$percentage%",
          style: TextStyle(fontSize: 16, color: Color(0xFFD9006C)),
        ),
      ],
    );
  }

  // Datos del gráfico de barras
  List<BarChartData> _getBarChartData() {
    return [
      BarChartData('Cat1', 10),
      BarChartData('Cat2', 30),
      BarChartData('Cat3', 20),
      BarChartData('Cat4', 50),
    ];
  }
}

// Modelos de datos para los gráficos
class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class BarChartData {
  BarChartData(this.category, this.value);
  final String category;
  final double value;
}

class _PieData {
  _PieData(this.x, this.y);
  final String x;
  final double y;
}
