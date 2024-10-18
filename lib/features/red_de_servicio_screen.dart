import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class RedDeServicioScreen extends StatefulWidget {
  const RedDeServicioScreen({super.key});

  @override
  _RedDeServicioScreenState createState() => _RedDeServicioScreenState();
}

class _RedDeServicioScreenState extends State<RedDeServicioScreen> {
  String? selectedSilais;
  String? selectedUnidadSalud;

  List<String> silaisList = ['SILAIS Managua', 'SILAIS Chontales'];
  List<String> establecimientosList = ['Unidad de Salud A', 'Unidad de Salud B'];

  TextEditingController silaisController = TextEditingController();
  TextEditingController unidadSaludController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const TextStyle titleStyle = TextStyle(
      fontSize: 20.0,
      color: Color(0xFFFF5D8F),
      fontWeight: FontWeight.bold,
    );

    const TextStyle subtitleStyle = TextStyle(fontSize: 18.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/ministerio_de_salud_nicaragua_2020.webp',
                        width: 195.0,
                        height: 150.0,
                      ),
                      const SizedBox(width: 30.0),
                      Image.asset(
                        'lib/assets/SIVEN-SD.webp',
                        width: 100.0,
                        height: 150.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 80.0),
                  Container(
                    width: screenWidth * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(255, 106, 153, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Text(
                            'RED DE SERVICIO - MINSA',
                            style: titleStyle,
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'ESTABLECER UNIDAD DE SALUD',
                            style: subtitleStyle,
                          ),
                          const SizedBox(height: 30.0),
                          
                          // Campo de selección de SILAIS
                          dropdownSearchField(
                            'SILAIS',
                            selectedSilais,
                            silaisList,
                            silaisController,
                            (val) {
                              setState(() {
                                selectedSilais = val;
                                selectedUnidadSalud = null;
                              });
                            },
                          ),
                          
                          const SizedBox(height: 30.0),
                          
                          // Campo de selección de Unidad de Salud
                          dropdownSearchField(
                            'Seleccione Unidad de Salud',
                            selectedUnidadSalud,
                            establecimientosList,
                            unidadSaludController,
                            (val) {
                              setState(() {
                                selectedUnidadSalud = val;
                              });
                            },
                          ),
                          
                          const SizedBox(height: 50.0),
                          
                          // Botón de continuar
                          continueButton(screenWidth),
                          
                          const SizedBox(height: 20.0),
                          
                          GestureDetector(
                            onTap: () {
                              // Navegar a la pantalla de login
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'Regresar',
                              style: TextStyle(
                                color: Color(0xFF1E88E5),
                                decoration: TextDecoration.underline,
                                fontSize: 16.0,
                              ),
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SIVEN 1.0',
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF757575)),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dropdownSearchField(
    String label,
    String? currentValue,
    List<String> items,
    TextEditingController controller,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Buscar $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 122, 193, 255),
                width: 2.0,
              ),
            ),
          ),
        ),
        emptyBuilder: (context, searchEntry) => Center(
          child: Text('No hay coincidencias de $label'),
        ),
        fit: FlexFit.tight,
      ),
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 122, 193, 255),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 122, 193, 255),
              width: 2.0,
            ),
          ),
        ),
      ),
      selectedItem: currentValue,
      onChanged: onChanged,
      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? '');
      },
    );
  }

  Widget continueButton(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.6,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          // Navegar a la pantalla de Home
          Navigator.pushNamed(context, '/home');
        },
        child: const Text(
          'CONTINUAR',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    silaisController.dispose();
    unidadSaludController.dispose();
    super.dispose();
  }
}
