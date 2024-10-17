import 'package:flutter/material.dart';

// Encabezado con el texto Bienvenido y logo
class EncabezadoBienvenida extends StatelessWidget {
  const EncabezadoBienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: const Text(
                  'Bienvenido a ',
                  style: TextStyle(
                    color: Color(0xFF1877F2),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Image.asset(
                  'lib/assets/homeicon/siven.webp', // Ruta del logo
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Botón Centro de Salud Acoyapa
class BotonCentroSalud extends StatelessWidget {
  const BotonCentroSalud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        child: const Icon(Icons.apartment, color: Color(0xFF4A4A4A), size: 14),
      ),
      label: const Text(
        'Centro de Salud de Acoyapa',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 163, 162, 162),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Ícono de perfil de usuario
class IconoPerfil extends StatelessWidget {
  const IconoPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0F0),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.person, color: Color(0xFF4A4A4A), size: 24),
        onPressed: () {
          // Acción para abrir perfil de usuario o configuraciones
        },
      ),
    );
  }
}

// Texto RED DE SERVICIO
class RedDeServicio extends StatelessWidget {
  const RedDeServicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'RED DE SERVICIO:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
          TextSpan(
            text: 'SILAIS CHONTALES\n',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF000000),
            ),
          ),
          TextSpan(
            text: 'CENTRO DE SALUD ACOYAPA',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
