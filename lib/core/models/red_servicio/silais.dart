class Silais {
  int idSilais;
  String nombre;
  String direccion;
  double latitud;
  double longitud;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String? usuarioModificacion;
  DateTime? fechaModificacion;
  bool activo;

  Silais({
    required this.idSilais,
    required this.nombre,
    required this.direccion,
    required this.latitud,
    required this.longitud,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    this.usuarioModificacion,
    this.fechaModificacion,
    required this.activo,
  });

  // Método para crear un objeto Silais desde un JSON
  factory Silais.fromJson(Map<String, dynamic> json) {
    return Silais(
      idSilais: json['id_silais'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      latitud: json['latitud'].toDouble(),
      longitud: json['longitud'].toDouble(),
      usuarioCreacion: json['usuario_creacion'],
      fechaCreacion: DateTime.parse(json['fecha_creacion']),
      usuarioModificacion: json['usuario_modificacion'],
      fechaModificacion: json['fecha_modificacion'] != null
          ? DateTime.parse(json['fecha_modificacion'])
          : null,
      activo: json['activo'],
    );
  }

  // Método para convertir el objeto Silais a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_silais': idSilais,
      'nombre': nombre,
      'direccion': direccion,
      'latitud': latitud,
      'longitud': longitud,
      'usuario_creacion': usuarioCreacion,
      'fecha_creacion': fechaCreacion.toIso8601String(),
      'usuario_modificacion': usuarioModificacion,
      'fecha_modificacion':
          fechaModificacion != null ? fechaModificacion!.toIso8601String() : null,
      'activo': activo,
    };
  }
}
