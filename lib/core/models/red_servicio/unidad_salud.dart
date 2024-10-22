class Establecimiento {
  int idEstablecimiento;
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

  Establecimiento({
    required this.idEstablecimiento,
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

  // Método para crear un objeto Establecimiento desde un JSON
  factory Establecimiento.fromJson(Map<String, dynamic> json) {
    return Establecimiento(
      idEstablecimiento: json['id_establecimiento'],
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

  // Método para convertir el objeto Establecimiento a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_establecimiento': idEstablecimiento,
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
