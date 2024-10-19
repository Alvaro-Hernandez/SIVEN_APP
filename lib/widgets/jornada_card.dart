import 'package:flutter/material.dart';

class JornadaCard extends StatelessWidget {
  final String jornadaNumero;
  final int numeroCasos;
  final String ubicacion;
  final String fechaInicio;
  final String fechaFin;
  final List<String> responsables;

  const JornadaCard({
    Key? key,
    required this.jornadaNumero,
    required this.numeroCasos,
    required this.ubicacion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.responsables,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jornadaNumero,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Número de casos",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    "$numeroCasos CASOS REGISTRADOS",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ubicación",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    ubicacion,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Responsables",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          ...responsables.map((responsable) => Text(
                responsable,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ubicación",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "Inicia $fechaInicio",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                "Finaliza $fechaFin",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
