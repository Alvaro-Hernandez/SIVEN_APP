class Persona {
  int idPersona;
  String codigoExpediente;
  String cedula;
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  DateTime fechaNacimiento;
  String sexo;
  String grupoEtnico;
  String ocupacion;
  String email;
  String escolaridad;
  String estadoCivil;
  String telefono;
  String tipoTelefono;
  String paisTelefono;
  String departamento;
  String municipio;
  String direccionDomicilio;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String? usuarioModificacion;
  DateTime? fechaModificacion;
  bool activo;

  Persona({
    required this.idPersona,
    required this.codigoExpediente,
    required this.cedula,
    required this.primerNombre,
    required this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.fechaNacimiento,
    required this.sexo,
    required this.grupoEtnico,
    required this.ocupacion,
    required this.email,
    required this.escolaridad,
    required this.estadoCivil,
    required this.telefono,
    required this.tipoTelefono,
    required this.paisTelefono,
    required this.departamento,
    required this.municipio,
    required this.direccionDomicilio,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    this.usuarioModificacion,
    this.fechaModificacion,
    required this.activo,
  });

  // Método para crear un objeto Persona desde un JSON
  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      idPersona: json['id_persona'],
      codigoExpediente: json['codigo_expediente'],
      cedula: json['cedula'],
      primerNombre: json['primer_nombre'],
      segundoNombre: json['segundo_nombre'],
      primerApellido: json['primer_apellido'],
      segundoApellido: json['segundo_apellido'],
      fechaNacimiento: DateTime.parse(json['fecha_nacimiento']),
      sexo: json['sexo'],
      grupoEtnico: json['grupo_etnico'],
      ocupacion: json['ocupacion'],
      email: json['email'],
      escolaridad: json['escolaridad'],
      estadoCivil: json['estado_civil'],
      telefono: json['telefono'],
      tipoTelefono: json['tipo_telefono'],
      paisTelefono: json['pais_telefono'],
      departamento: json['departamento'],
      municipio: json['municipio'],
      direccionDomicilio: json['direccion_domicilio'],
      usuarioCreacion: json['usuario_creacion'],
      fechaCreacion: DateTime.parse(json['fecha_creacion']),
      usuarioModificacion: json['usuario_modificacion'],
      fechaModificacion: json['fecha_modificacion'] != null
          ? DateTime.parse(json['fecha_modificacion'])
          : null,
      activo: json['activo'],
    );
  }

  // Método para convertir el objeto Persona a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_persona': idPersona,
      'codigo_expediente': codigoExpediente,
      'cedula': cedula,
      'primer_nombre': primerNombre,
      'segundo_nombre': segundoNombre,
      'primer_apellido': primerApellido,
      'segundo_apellido': segundoApellido,
      'fecha_nacimiento': fechaNacimiento.toIso8601String(),
      'sexo': sexo,
      'grupo_etnico': grupoEtnico,
      'ocupacion': ocupacion,
      'email': email,
      'escolaridad': escolaridad,
      'estado_civil': estadoCivil,
      'telefono': telefono,
      'tipo_telefono': tipoTelefono,
      'pais_telefono': paisTelefono,
      'departamento': departamento,
      'municipio': municipio,
      'direccion_domicilio': direccionDomicilio,
      'usuario_creacion': usuarioCreacion,
      'fecha_creacion': fechaCreacion.toIso8601String(),
      'usuario_modificacion': usuarioModificacion,
      'fecha_modificacion':
          fechaModificacion != null ? fechaModificacion!.toIso8601String() : null,
      'activo': activo,
    };
  }
}
