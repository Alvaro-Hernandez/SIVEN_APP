import 'package:flutter/material.dart';
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart';
import 'package:siven_app/widgets/version.dart';
import 'package:siven_app/widgets/TextField.dart'; // Importamos el widget reutilizable
import 'package:siven_app/widgets/custom_date_field.dart'; // Importamos el nuevo widget de fecha

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

  // Listas de opciones
  final List<String> silaisOptions = ['SILAIS_MANAGUA', 'SILAIS_CHONTALES'];
  final List<String> eventoOptions = ['COVID-19', 'Malaria'];
  final List<String> unidadSaludOptions = ['UNIDAD DE SALUD LOS ROBLES', 'UNIDAD DE SALUD SAN FRANCISCO'];

  // Controladores para Autocomplete
  final TextEditingController _silaisController = TextEditingController();
  final TextEditingController _unidadSaludController = TextEditingController();
  final TextEditingController _eventoController = TextEditingController();

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

                    // Campos de Fecha de inicio y Fecha de fin con el widget reutilizable CustomDateField
                    Row(
                      children: [
                        Expanded(
                          child: CustomDateField(
                            hintText: 'Fecha de Inicio',
                            controller: _startDateController,
                            borderColor: salmonColor,
                            iconColor: Colors.grey,
                            borderWidth: 2.0,
                            borderRadius: 5.0,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomDateField(
                            hintText: 'Fecha de Fin',
                            controller: _endDateController,
                            borderColor: salmonColor,
                            iconColor: Colors.grey,
                            borderWidth: 2.0,
                            borderRadius: 5.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete SILAIS reutilizando el widget CustomTextFieldDropdown
                    CustomTextFieldDropdown(
                      hintText: 'SILAIS de la captación',
                      controller: _silaisController,
                      options: silaisOptions,
                      borderColor: salmonColor,
                      borderWidth: 2.0,
                      borderRadius: 5.0,
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete Unidad de Salud reutilizando el widget CustomTextFieldDropdown
                    CustomTextFieldDropdown(
                      hintText: 'Unidad de Salud',
                      controller: _unidadSaludController,
                      options: unidadSaludOptions,
                      borderColor: salmonColor,
                      borderWidth: 2.0,
                      borderRadius: 5.0,
                    ),
                    const SizedBox(height: 20),

                    // Autocomplete Evento de Salud reutilizando el widget CustomTextFieldDropdown
                    CustomTextFieldDropdown(
                      hintText: 'Evento de salud',
                      controller: _eventoController,
                      options: eventoOptions,
                      borderColor: salmonColor,
                      borderWidth: 2.0,
                      borderRadius: 5.0,
                    ),
                    const SizedBox(height: 30),

                    // Botón Buscar
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/resultados_busqueda');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: salmonColor,
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
                        _unidadSaludController.clear();
                        _eventoController.clear();
                      },
                      child: const Text(
                        'LIMPIAR',
                        style: TextStyle(fontSize: 14, color: salmonColor),
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
