// Archivo: captacion.dart

import 'package:flutter/material.dart';
import 'package:siven_app/widgets/version.dart'; // Widget reutilizado
import 'package:siven_app/widgets/Encabezado_reporte_analisis.dart'; // Widget reutilizado
import 'package:siven_app/widgets/TextField.dart'; // Asegúrate de usar el nombre correcto

class Captacion extends StatefulWidget {
  const Captacion({Key? key}) : super(key: key);

  @override
  _CaptacionState createState() => _CaptacionState();
}

class _CaptacionState extends State<Captacion> {
  int _currentCardIndex = 0; // Índice de la card actual

  // Controladores para la primera card
  final TextEditingController maternidadController = TextEditingController();
  final TextEditingController esTrabajadorSaludController = TextEditingController();
  final TextEditingController silaisController = TextEditingController();
  final TextEditingController unidadController = TextEditingController();
  final TextEditingController comorbilidades1Controller = TextEditingController();
  final TextEditingController comorbilidades2Controller = TextEditingController();
  final TextEditingController jefeFamiliaController = TextEditingController();
  final TextEditingController telefono1Controller = TextEditingController();
  final TextEditingController telefono2Controller = TextEditingController();

  // Controladores para la segunda card
  final TextEditingController datoCaptacionSelectorController = TextEditingController();
  final TextEditingController datoCaptacionInputController = TextEditingController();
  final TextEditingController busquedaNombreController = TextEditingController();
  final TextEditingController telefonoJefeFamiliaCaptacionController = TextEditingController();

  // Controladores para la tercera card
  final TextEditingController datoNotificacion1Controller = TextEditingController();
  final TextEditingController datoNotificacion2Controller = TextEditingController();
  final TextEditingController datoNotificacion3Controller = TextEditingController();
  final TextEditingController datoNotificacion4Controller = TextEditingController();
  final TextEditingController datoNotificacion5Controller = TextEditingController();
  final TextEditingController busquedaNombreNotificacion1Controller = TextEditingController();
  final TextEditingController telefonoJefeFamiliaNotificacionController = TextEditingController();
  final TextEditingController busquedaNombreNotificacion2Controller = TextEditingController();

  @override
  void dispose() {
    // Dispose de los controladores de la primera card
    maternidadController.dispose();
    esTrabajadorSaludController.dispose();
    silaisController.dispose();
    unidadController.dispose();
    comorbilidades1Controller.dispose();
    comorbilidades2Controller.dispose();
    jefeFamiliaController.dispose();
    telefono1Controller.dispose();
    telefono2Controller.dispose();

    // Dispose de los controladores de la segunda card
    datoCaptacionSelectorController.dispose();
    datoCaptacionInputController.dispose();
    busquedaNombreController.dispose();
    telefonoJefeFamiliaCaptacionController.dispose();

    // Dispose de los controladores de la tercera card
    datoNotificacion1Controller.dispose();
    datoNotificacion2Controller.dispose();
    datoNotificacion3Controller.dispose();
    datoNotificacion4Controller.dispose();
    datoNotificacion5Controller.dispose();
    busquedaNombreNotificacion1Controller.dispose();
    telefonoJefeFamiliaNotificacionController.dispose();
    busquedaNombreNotificacion2Controller.dispose();

    super.dispose();
  }

  // Métodos de navegación
  void _nextCard() {
    if (_currentCardIndex < 2) { // Ahora hay tres cards: índice 0, 1 y 2
      setState(() {
        _currentCardIndex++;
      });
    }
  }

  void _previousCard() {
    if (_currentCardIndex > 0) {
      setState(() {
        _currentCardIndex--;
      });
    }
  }

  // Método para limpiar todos los campos
  void _limpiarCampos() {
    setState(() {
      // Limpiar controladores de la primera card
      maternidadController.clear();
      esTrabajadorSaludController.clear();
      silaisController.clear();
      unidadController.clear();
      comorbilidades1Controller.clear();
      comorbilidades2Controller.clear();
      jefeFamiliaController.clear();
      telefono1Controller.clear();
      telefono2Controller.clear();

      // Limpiar controladores de la segunda card
      datoCaptacionSelectorController.clear();
      datoCaptacionInputController.clear();
      busquedaNombreController.clear();
      telefonoJefeFamiliaCaptacionController.clear();

      // Limpiar controladores de la tercera card
      datoNotificacion1Controller.clear();
      datoNotificacion2Controller.clear();
      datoNotificacion3Controller.clear();
      datoNotificacion4Controller.clear();
      datoNotificacion5Controller.clear();
      busquedaNombreNotificacion1Controller.clear();
      telefonoJefeFamiliaNotificacionController.clear();
      busquedaNombreNotificacion2Controller.clear();
    });
  }

  // Método para renderizar el contenido de la card basado en el índice actual
  Widget _buildCardContent() {
    if (_currentCardIndex == 0) {
      return _buildFirstCard();
    } else if (_currentCardIndex == 1) {
      return _buildSecondCard();
    } else if (_currentCardIndex == 2) {
      return _buildThirdCard();
    } else {
      return _buildFirstCard(); // Valor por defecto
    }
  }

  // Método para construir la primera card
  Widget _buildFirstCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF00C1D4), width: 1),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la Card Modificado
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C1D4), // Fondo celeste
                    borderRadius: BorderRadius.circular(4), // Bordes ligeramente redondeados
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white, // Texto blanco dentro del cuadrado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espacio entre el número y el texto
                const Text(
                  'Datos del paciente',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00C1D4), // Texto en color celeste
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Resto del contenido de la primera card

            // Fila 1: Maternidad
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Maternidad *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: maternidadController,
                  options: ['Opción 1', 'Opción 2', 'Opción 3'], // Reemplaza con tus opciones
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 2: ¿Es trabajador de la salud?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¿Es trabajador de la salud? *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: esTrabajadorSaludController,
                  options: ['Sí', 'No'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 3: SILAIS del trabajador
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SILAIS del trabajador *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: silaisController,
                  options: ['SILAIS - ESTELÍ', 'SILAIS - LEÓN', 'SILAIS - MANAGUA'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 4: Unidad de salud del trabajador
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Unidad de salud del trabajador *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: unidadController,
                  options: ['Consultorio Médico Roger Montoya', 'CAPS - LEÓN'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 5: ¿Presenta comorbilidades?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¿Presenta comorbilidades? *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: comorbilidades1Controller,
                  options: ['Sí', 'No'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 6: Comorbilidades
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Comorbilidades *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: comorbilidades2Controller,
                  options: ['AUTISMO', 'DIABETES', 'HIPERTENSIÓN'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 7: Nombre completo del jefe de familia
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nombre completo del jefe de familia *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: jefeFamiliaController,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el nombre completo',
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 8: Teléfono del jefe de familia
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Teléfono del jefe de familia *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: telefono1Controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el teléfono',
                    prefixIcon: const Icon(Icons.phone, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 9: Teléfono del jefe de familia (repetido)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Teléfono del jefe de familia *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: telefono2Controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el teléfono',
                    prefixIcon: const Icon(Icons.phone, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 10: Presenta comorbilidades y Comorbilidades (repetida)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¿Presenta comorbilidades? *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: comorbilidades1Controller, // Puedes usar otro controlador si es necesario
                  options: ['Sí', 'No'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Comorbilidades *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: comorbilidades2Controller, // Puedes usar otro controlador si es necesario
                  options: ['AUTISMO', 'DIABETES', 'HIPERTENSIÓN'],
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir la segunda card
  Widget _buildSecondCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF00C1D4), width: 1),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la Card Modificado para la Segunda Card
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C1D4), // Fondo celeste
                    borderRadius: BorderRadius.circular(4), // Bordes ligeramente redondeados
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white, // Texto blanco dentro del cuadrado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espacio entre el número y el texto
                const Text(
                  'Datos de Captación',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00C1D4), // Texto en color celeste
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Resto del contenido de la segunda card

            // Fila 1: Dato de captación (selector)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: datoCaptacionSelectorController,
                  options: ['Opción A', 'Opción B', 'Opción C'], // Reemplaza con tus opciones
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 2: Dato de captación (Ingrese datos de la captacion)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: datoCaptacionInputController,
                  decoration: InputDecoration(
                    hintText: 'Ingrese datos de la captación',
                    prefixIcon: const Icon(Icons.text_fields, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 3: Dato de captación (selector)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: datoCaptacionSelectorController,
                  options: ['Opción X', 'Opción Y', 'Opción Z'], // Reemplaza con tus opciones
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 4: Dato de captación (campo de búsqueda: "Realizar búsqueda por nombre")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: busquedaNombreController,
                  decoration: InputDecoration(
                    hintText: 'Realizar búsqueda por nombre',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 5: Dato de captación (campo de texto: "Ingresa el teléfono del jefe de familia")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: telefonoJefeFamiliaCaptacionController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el teléfono del jefe de familia',
                    prefixIcon: const Icon(Icons.phone, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 6: Dato de captación (selector)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: datoCaptacionSelectorController,
                  options: ['Opción A', 'Opción B', 'Opción C'], // Reemplaza con tus opciones
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 7: Dato de captación (campo de búsqueda: "Realizar búsqueda por nombre")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de Captación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: busquedaNombreController,
                  decoration: InputDecoration(
                    hintText: 'Realizar búsqueda por nombre',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir la tercera card
  Widget _buildThirdCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF00C1D4), width: 1),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la Card
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C1D4), // Fondo celeste
                    borderRadius: BorderRadius.circular(4), // Bordes ligeramente redondeados
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white, // Texto blanco dentro del cuadrado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espacio entre el número y el texto
                const Text(
                  'Datos Notificación',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00C1D4), // Texto en color celeste
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 1: Dato de notificación (selector) y Dato de notificación (selector)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion1Controller,
                        options: ['Opción 1', 'Opción 2', 'Opción 3'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion2Controller,
                        options: ['Opción A', 'Opción B', 'Opción C'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 2: Dato de notificación (selector)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de notificación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextFieldDropdown(
                  hintText: 'Selecciona una opción',
                  controller: datoNotificacion3Controller,
                  options: ['Opción X', 'Opción Y', 'Opción Z'], // Reemplaza con tus opciones
                  borderColor: const Color(0xFF00C1D4),
                  borderRadius: 8.0,
                  width: double.infinity,
                  height: 55.0,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 3: Dato de notificación (campo de texto: "Ingrese dato de notificación")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de notificación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: datoNotificacion4Controller,
                  decoration: InputDecoration(
                    hintText: 'Ingrese dato de notificación',
                    prefixIcon: const Icon(Icons.text_fields, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 4: Dato de notificación (selector) y Dato de notificación (selector)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion5Controller,
                        options: ['Opción 4', 'Opción 5', 'Opción 6'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion2Controller,
                        options: ['Opción A', 'Opción B', 'Opción C'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 5: Dato de notificación (campo de búsqueda: "Realizar búsqueda por nombre")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de notificación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: busquedaNombreNotificacion1Controller,
                  decoration: InputDecoration(
                    hintText: 'Realizar búsqueda por nombre',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 6: Dato de notificación (campo de texto: "Ingresa el teléfono del jefe de familia")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de notificación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: telefonoJefeFamiliaNotificacionController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el teléfono del jefe de familia',
                    prefixIcon: const Icon(Icons.phone, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 7: Dato de notificación (selector) y Dato de notificación (selector)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion1Controller,
                        options: ['Opción 1', 'Opción 2', 'Opción 3'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dato de notificación *',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextFieldDropdown(
                        hintText: 'Selecciona una opción',
                        controller: datoNotificacion2Controller,
                        options: ['Opción A', 'Opción B', 'Opción C'], // Reemplaza con tus opciones
                        borderColor: const Color(0xFF00C1D4),
                        borderRadius: 8.0,
                        width: double.infinity,
                        height: 55.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fila 8: Dato de notificación (campo de búsqueda: "Realizar búsqueda por nombre")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dato de notificación *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: busquedaNombreNotificacion2Controller,
                  decoration: InputDecoration(
                    hintText: 'Realizar búsqueda por nombre',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF00C1D4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00C1D4)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        backgroundColor: Colors.white, // Fondo blanco en el AppBar
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
        title: const EncabezadoBienvenida(), // No se toca
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

                  // Encabezado Azul
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: const Color(0xFF00C1D4), // Color celeste
                    child: const Center(
                      child: Text(
                        'Evento de salud - Captación Malaria',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Fila con icono de usuario y texto
                  Row(
                    children: const [
                      Icon(Icons.person, color: Color(0xFF00C1D4)),
                      SizedBox(width: 10),
                      Text(
                        'Ver detalle del paciente - Alvaro Hernández',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Mostrar el contenido de la card según la página
                  _buildCardContent(),
                ],
              ),
            ),
          ),

          // Footer con botones de navegación
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón "ANTERIOR"
                ElevatedButton(
                  onPressed: _previousCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ANTERIOR',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                // Indicadores de página
                Row(
                  children: [
                    for (int i = 0; i < 3; i++) // Ahora tres cards
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: _currentCardIndex == i ? Colors.blue : Colors.grey,
                        ),
                      ),
                  ],
                ),

                // Botón "SIGUIENTE"
                ElevatedButton(
                  onPressed: _currentCardIndex < 2 ? _nextCard : null, // Deshabilitar en la última card
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C1D4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'SIGUIENTE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // **Botón "LIMPIAR" eliminado**
              ],
            ),
          ),

          const VersionWidget(), // No se toca
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Captacion(),
  ));
}
