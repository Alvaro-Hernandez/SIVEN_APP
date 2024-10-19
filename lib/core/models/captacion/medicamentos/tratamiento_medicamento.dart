class Tratamiento {
  int idTratamiento;
  int idPersona;
  int idCaptacion;
  DateTime fechaPrescripcion;
  int idMedicamento;
  int nDiasRecibidos;
  int totalTratamientoAplicarse;
  double dosisDiariaTotal;
  int idUnidadMedidaDosis;
  int frecuenciaDiariaDosis;
  int idUnidadMedidaFrecuencia;
  int idViaAdministracion;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String? usuarioModificacion;
  DateTime? fechaModificacion;
  bool activo;

  Tratamiento({
    required this.idTratamiento,
    required this.idPersona,
    required this.idCaptacion,
    required this.fechaPrescripcion,
    required this.idMedicamento,
    required this.nDiasRecibidos,
    required this.totalTratamientoAplicarse,
    required this.dosisDiariaTotal,
    required this.idUnidadMedidaDosis,
    required this.frecuenciaDiariaDosis,
    required this.idUnidadMedidaFrecuencia,
    required this.idViaAdministracion,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    this.usuarioModificacion,
    this.fechaModificacion,
    required this.activo,
  });

  // Método para crear un objeto Tratamiento desde un JSON
  factory Tratamiento.fromJson(Map<String, dynamic> json) {
    return Tratamiento(
      idTratamiento: json['id_tratamiento'],
      idPersona: json['id_persona'],
      idCaptacion: json['id_captacion'],
      fechaPrescripcion: DateTime.parse(json['fecha_prescripcion']),
      idMedicamento: json['id_medicamento'],
      nDiasRecibidos: json['n_dias_recibidos'],
      totalTratamientoAplicarse: json['total_tratamiento_aplicarse'],
      dosisDiariaTotal: json['dosis_diaria_total'].toDouble(),
      idUnidadMedidaDosis: json['id_unidad_medida_dosis'],
      frecuenciaDiariaDosis: json['frecuencia_diaria_dosis'],
      idUnidadMedidaFrecuencia: json['id_unidad_medida_frecuencia'],
      idViaAdministracion: json['id_via_administracion'],
      usuarioCreacion: json['usuario_creacion'],
      fechaCreacion: DateTime.parse(json['fecha_creacion']),
      usuarioModificacion: json['usuario_modificacion'],
      fechaModificacion: json['fecha_modificacion'] != null
          ? DateTime.parse(json['fecha_modificacion'])
          : null,
      activo: json['activo'],
    );
  }

  // Método para convertir el objeto Tratamiento a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_tratamiento': idTratamiento,
      'id_persona': idPersona,
      'id_captacion': idCaptacion,
      'fecha_prescripcion': fechaPrescripcion.toIso8601String(),
      'id_medicamento': idMedicamento,
      'n_dias_recibidos': nDiasRecibidos,
      'total_tratamiento_aplicarse': totalTratamientoAplicarse,
      'dosis_diaria_total': dosisDiariaTotal,
      'id_unidad_medida_dosis': idUnidadMedidaDosis,
      'frecuencia_diaria_dosis': frecuenciaDiariaDosis,
      'id_unidad_medida_frecuencia': idUnidadMedidaFrecuencia,
      'id_via_administracion': idViaAdministracion,
      'usuario_creacion': usuarioCreacion,
      'fecha_creacion': fechaCreacion.toIso8601String(),
      'usuario_modificacion': usuarioModificacion,
      'fecha_modificacion': fechaModificacion != null ? fechaModificacion!.toIso8601String() : null,
      'activo': activo,
    };
  }
}
