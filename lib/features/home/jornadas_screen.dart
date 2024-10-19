import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:siven_app/widgets/jornada_card.dart'; // Importación de tu widget JornadaCard

class JornadasScreen extends StatefulWidget {
  @override
  _JornadasScreenState createState() => _JornadasScreenState();
}

class _JornadasScreenState extends State<JornadasScreen> {
  DateTime _selectedDay = DateTime.now();
  
  // Datos estáticos de jornadas
  List<Map<String, dynamic>> jornadas = [
    {
      'date': DateTime(2024, 10, 17),
      'numeroCasos': 40,
      'responsables': ['Lic. Ana Perez (SILAIS - León)', 'Lic. Mario Lopez (SILAIS - León)'],
      'ubicacion': 'León, Nicaragua',
      'fechaInicio': '17/10/2024',
      'fechaFin': '22/10/2024'
    },
    {
      'date': DateTime(2024, 10, 18),
      'numeroCasos': 50,
      'responsables': ['Lic. Carla Mendoza (SILAIS - Granada)', 'Lic. Pedro Gómez (SILAIS - Granada)'],
      'ubicacion': 'Granada, Nicaragua',
      'fechaInicio': '18/10/2024',
      'fechaFin': '24/10/2024'
    },
    {
      'date': DateTime(2024, 10, 19),
      'numeroCasos': 35,
      'responsables': ['Lic. María Gutiérrez (SILAIS - Chontales)', 'Lic. Alberto Fargas (SILAIS - Chontales)'],
      'ubicacion': 'Acoyapa, Chontales',
      'fechaInicio': '14/10/2024',
      'fechaFin': '20/10/2024'
    },
  ];

  // Función para filtrar las jornadas según la fecha seleccionada
  List<Map<String, dynamic>> getFilteredJornadas() {
    return jornadas.where((jornada) => isSameDay(jornada['date'], _selectedDay)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Calendario
          TableCalendar(
            locale: 'es_ES',
            firstDay: DateTime(2024, 10, 1),
            lastDay: DateTime(2024, 10, 31),
            focusedDay: _selectedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.purple.shade300,
                shape: BoxShape.circle,
              ),
              markersMaxCount: 1,
              markerDecoration: BoxDecoration(
                color: Colors.purple.shade800,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              formatButtonVisible: false,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.purple),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.purple),
            ),
          ),
          const SizedBox(height: 20),
          // Filtros
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                items: ['Estado', 'Pendiente', 'Completado']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (_) {},
                hint: Text('Estado', style: TextStyle(color: Colors.purple)),
              ),
              DropdownButton<String>(
                items: ['Período', 'Última semana', 'Último mes']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (_) {},
                hint: Text('Período', style: TextStyle(color: Colors.purple)),
              ),
              DropdownButton<String>(
                items: ['Localización', 'Chontales', 'Managua', 'León']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (_) {},
                hint: Text('Localización', style: TextStyle(color: Colors.purple)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Jornadas dinámicas
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredJornadas().length,
              itemBuilder: (context, index) {
                final jornada = getFilteredJornadas()[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: JornadaCard(
                    jornadaNumero: 'Jornada No.${index + 145}', // Número dinámico para las jornadas
                    numeroCasos: jornada['numeroCasos'],
                    ubicacion: jornada['ubicacion'],
                    fechaInicio: jornada['fechaInicio'],
                    fechaFin: jornada['fechaFin'],
                    responsables: jornada['responsables'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
