class Seguimiento {
  int idSeguimiento;
  int idPaciente;
  int idCaptacion;
  int idTratamiento;
  int idTipoSeguimiento;
  DateTime fechaDeSeguimiento;
  int semanaEpidemiologica;
  int idPersona;
  double pesoPaciente;
  int idTipoDeAlta;
  DateTime? fechaDefuncion;
  bool estadoPaciente;
  int idSintomas;
  String observacionesDelSeguimiento;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String? usuarioModificacion;
  DateTime? fechaModificacion;
  bool activo;

  Seguimiento({
    required this.idSeguimiento,
    required this.idPaciente,
    required this.idCaptacion,
    required this.idTratamiento,
    required this.idTipoSeguimiento,
    required this.fechaDeSeguimiento,
    required this.semanaEpidemiologica,
    required this.idPersona,
    required this.pesoPaciente,
    required this.idTipoDeAlta,
    this.fechaDefuncion,
    required this.estadoPaciente,
    required this.idSintomas,
    required this.observacionesDelSeguimiento,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    this.usuarioModificacion,
    this.fechaModificacion,
    required this.activo,
  });

  // Método para crear un objeto Seguimiento desde un JSON
  factory Seguimiento.fromJson(Map<String, dynamic> json) {
    return Seguimiento(
      idSeguimiento: json['id_seguimiento'],
      idPaciente: json['id_paciente'],
      idCaptacion: json['id_captacion'],
      idTratamiento: json['id_tratamiento'],
      idTipoSeguimiento: json['id_tipo_seguimiento'],
      fechaDeSeguimiento: DateTime.parse(json['fecha_de_seguimiento']),
      semanaEpidemiologica: json['semana_epidemiologica'],
      idPersona: json['id_persona'],
      pesoPaciente: json['peso_paciente'].toDouble(),
      idTipoDeAlta: json['id_tipo_de_alta'],
      fechaDefuncion: json['fecha_defuncion'] != null
          ? DateTime.parse(json['fecha_defuncion'])
          : null,
      estadoPaciente: json['estado_Paciente'],
      idSintomas: json['id_sintomas'],
      observacionesDelSeguimiento: json['observaciones_del_seguimiento'],
      usuarioCreacion: json['usuario_creacion'],
      fechaCreacion: DateTime.parse(json['fecha_creacion']),
      usuarioModificacion: json['usuario_modificacion'],
      fechaModificacion: json['fecha_modificacion'] != null
          ? DateTime.parse(json['fecha_modificacion'])
          : null,
      activo: json['activo'],
    );
  }

  // Método para convertir el objeto Seguimiento a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_seguimiento': idSeguimiento,
      'id_paciente': idPaciente,
      'id_captacion': idCaptacion,
      'id_tratamiento': idTratamiento,
      'id_tipo_seguimiento': idTipoSeguimiento,
      'fecha_de_seguimiento': fechaDeSeguimiento.toIso8601String(),
      'semana_epidemiologica': semanaEpidemiologica,
      'id_persona': idPersona,
      'peso_paciente': pesoPaciente,
      'id_tipo_de_alta': idTipoDeAlta,
      'fecha_defuncion': fechaDefuncion != null ? fechaDefuncion!.toIso8601String() : null,
      'estado_Paciente': estadoPaciente,
      'id_sintomas': idSintomas,
      'observaciones_del_seguimiento': observacionesDelSeguimiento,
      'usuario_creacion': usuarioCreacion,
      'fecha_creacion': fechaCreacion.toIso8601String(),
      'usuario_modificacion': usuarioModificacion,
      'fecha_modificacion': fechaModificacion != null ? fechaModificacion!.toIso8601String() : null,
      'activo': activo,
    };
  }
}
