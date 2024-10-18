import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart';
import 'package:siven_app/widgets/version.dart'; // Importa el widget reutilizable

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para las fechas
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  // Listas de opciones
  final List<String> silaisOptions = ['SILAIS Managua', 'SILAIS Chontales'];
  final List<String> eventoOptions = ['COVID-19', 'Dengue'];

  // Controladores para Autocomplete
  final TextEditingController _silaisController = TextEditingController();
  final TextEditingController _eventoController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller, DateTime? initialDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color salmonColor = Color(0xFFF7941D);

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
              // Navegación a /home
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        title: const EncabezadoBienvenida(),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuir widgets con espacio entre ellos
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
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

                    // Texto e ícono de búsqueda
                    Row(
                      children: [
                        Icon(Icons.search, color: salmonColor, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Informe de evento de Salud',
                          style: TextStyle(fontSize: 18, color: salmonColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Campos de Fecha de inicio y Fecha de fin con selector de fecha
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _startDateController,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, _startDateController, _selectedStartDate);
                            },
                            decoration: InputDecoration(
                              hintText: 'Fecha de Inicio',
                              suffixIcon: const Icon(Icons.calendar_today, size: 20, color: Color(0xFF4A4A4A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFF7941D), width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _endDateController,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, _endDateController, _selectedEndDate);
                            },
                            decoration: InputDecoration(
                              hintText: 'Fecha de Fin',
                              suffixIcon: const Icon(Icons.calendar_today, size: 20, color: Color(0xFF4A4A4A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Color(0xFFF7941D), width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete SILAIS
                    Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return silaisOptions.where((String option) {
                          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        _silaisController.text = selection;
                      },
                      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                        return TextFormField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'SILAIS de la captación',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Color(0xFFF7941D), width: 1.0),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete Evento de Salud
                    Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return eventoOptions.where((String option) {
                          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        _eventoController.text = selection;
                      },
                      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                        return TextFormField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'Evento de salud',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Color(0xFFF7941D), width: 1.0),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),

                    // Botón Buscar
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navegación a resultados_busqueda
                          Navigator.pushNamed(context, '/resultados_busqueda');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7941D),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Buscar', style: TextStyle(color: Colors.white)),
                    ),

                    const SizedBox(height: 20),

                    // Botón Limpiar
                    TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        _startDateController.clear();
                        _endDateController.clear();
                        _silaisController.clear();
                        _eventoController.clear();
                      },
                      child: const Text(
                        'LIMPIAR',
                        style: TextStyle(fontSize: 14, color: Color(0xFFF7941D)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VersionWidget(), // Añadimos el widget de la versión en la parte inferior
        ],
      ),
    );
  }
}
