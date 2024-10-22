class Captacion {
  int idCaptacion;
  int idEventoSalud;
  int idPersona;
  int idMaternidad;
  int semanaGestacion;
  bool trabajadorSalud;
  int idSilaisTrabajador;
  int idEstablecimientoTrabajador;
  bool tieneComorbilidades;
  int idComorbilidades;
  String nombreJefeFamilia;
  String telefonoReferencia;
  int idLugarCaptacion;
  int idCondicionPersona;
  DateTime fechaCaptacion;
  int semanaEpidemiologica;
  int idSilaisCaptacion;
  int idEstablecimientoCaptacion;
  int idPersonaCaptacion;
  int idSitioExposicion;
  double latitudOcurrencia;
  double longitudOcurrencia;
  bool presentaSintomas;
  DateTime fechaInicioSintomas;
  int idSintomas;
  bool fueReferido;
  int idSilaisTraslado;
  int idEstablecimientoTraslado;
  bool esViajero;
  DateTime fechaIngresoPais;
  int idLugarIngresoPais;
  String direccionOcurrencia;
  String observacionesCaptacion;
  int idPuestoNotificacion;
  String noClave;
  int noLamina;
  int tomaMuestra;
  bool tipoBusqueda;
  int idDiagnostico;
  DateTime fechaTomaMuestra;
  DateTime fechaRecepcionLaboratorio;
  DateTime fechaDiagnostico;
  int idResultadoDiagnostico;
  int densidadParasitariaVivaxEas;
  int densidadParasitariaVivaxEss;
  int densidadParasitariaFalciparumEas;
  int densidadParasitariaFalciparumEss;
  int idSilaisDiagnostico;
  int idEstablecimientoDiagnostico;
  bool existenciaReinfeccion;
  bool eventoSaludExtranjero;
  int idPaisOcurrenciaEventoSalud;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String? usuarioModificacion;
  DateTime? fechaModificacion;
  bool activo;

  Captacion({
    required this.idCaptacion,
    required this.idEventoSalud,
    required this.idPersona,
    required this.idMaternidad,
    required this.semanaGestacion,
    required this.trabajadorSalud,
    required this.idSilaisTrabajador,
    required this.idEstablecimientoTrabajador,
    required this.tieneComorbilidades,
    required this.idComorbilidades,
    required this.nombreJefeFamilia,
    required this.telefonoReferencia,
    required this.idLugarCaptacion,
    required this.idCondicionPersona,
    required this.fechaCaptacion,
    required this.semanaEpidemiologica,
    required this.idSilaisCaptacion,
    required this.idEstablecimientoCaptacion,
    required this.idPersonaCaptacion,
    required this.idSitioExposicion,
    required this.latitudOcurrencia,
    required this.longitudOcurrencia,
    required this.presentaSintomas,
    required this.fechaInicioSintomas,
    required this.idSintomas,
    required this.fueReferido,
    required this.idSilaisTraslado,
    required this.idEstablecimientoTraslado,
    required this.esViajero,
    required this.fechaIngresoPais,
    required this.idLugarIngresoPais,
    required this.direccionOcurrencia,
    required this.observacionesCaptacion,
    required this.idPuestoNotificacion,
    required this.noClave,
    required this.noLamina,
    required this.tomaMuestra,
    required this.tipoBusqueda,
    required this.idDiagnostico,
    required this.fechaTomaMuestra,
    required this.fechaRecepcionLaboratorio,
    required this.fechaDiagnostico,
    required this.idResultadoDiagnostico,
    required this.densidadParasitariaVivaxEas,
    required this.densidadParasitariaVivaxEss,
    required this.densidadParasitariaFalciparumEas,
    required this.densidadParasitariaFalciparumEss,
    required this.idSilaisDiagnostico,
    required this.idEstablecimientoDiagnostico,
    required this.existenciaReinfeccion,
    required this.eventoSaludExtranjero,
    required this.idPaisOcurrenciaEventoSalud,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    this.usuarioModificacion,
    this.fechaModificacion,
    required this.activo,
  });

  // Método para crear un objeto Captacion desde un JSON
  factory Captacion.fromJson(Map<String, dynamic> json) {
    return Captacion(
      idCaptacion: json['id_captacion'],
      idEventoSalud: json['id_evento_salud'],
      idPersona: json['id_persona'],
      idMaternidad: json['id_maternidad'],
      semanaGestacion: json['semana_gestacion'],
      trabajadorSalud: json['trabajador_salud'],
      idSilaisTrabajador: json['id_silais_trabajador'],
      idEstablecimientoTrabajador: json['id_establecimiento_trabajador'],
      tieneComorbilidades: json['tiene_comorbilidades'],
      idComorbilidades: json['id_comorbilidades'],
      nombreJefeFamilia: json['nombre_jefe_familia'],
      telefonoReferencia: json['telefono_referencia'],
      idLugarCaptacion: json['id_lugar_captacion'],
      idCondicionPersona: json['id_condicion_persona'],
      fechaCaptacion: DateTime.parse(json['fecha_captacion']),
      semanaEpidemiologica: json['semana_epidemiologica'],
      idSilaisCaptacion: json['id_silais_captacion'],
      idEstablecimientoCaptacion: json['id_establecimiento_captacion'],
      idPersonaCaptacion: json['id_persona_captacion'],
      idSitioExposicion: json['id_sitio_exposicion'],
      latitudOcurrencia: json['latitud_ocurrencia'].toDouble(),
      longitudOcurrencia: json['longitud_ocurrencia'].toDouble(),
      presentaSintomas: json['presenta_sintomas'],
      fechaInicioSintomas: DateTime.parse(json['fecha_inicio_sintomas']),
      idSintomas: json['id_sintomas'],
      fueReferido: json['fue_referido'],
      idSilaisTraslado: json['id_silais_traslado'],
      idEstablecimientoTraslado: json['id_establecimiento_traslado'],
      esViajero: json['es_viajero'],
      fechaIngresoPais: DateTime.parse(json['fecha_ingreso_pais']),
      idLugarIngresoPais: json['id_lugar_ingreso_pais'],
      direccionOcurrencia: json['direccion_ocurrencia'],
      observacionesCaptacion: json['observaciones_captacion'],
      idPuestoNotificacion: json['id_puesto_notificacion'],
      noClave: json['no_clave'],
      noLamina: json['no_lamina'],
      tomaMuestra: json['toma_muestra'],
      tipoBusqueda: json['tipobusqueda'],
      idDiagnostico: json['id_diagnostico'],
      fechaTomaMuestra: DateTime.parse(json['fecha_toma_muestra']),
      fechaRecepcionLaboratorio: DateTime.parse(json['fecha_recepcion_laboratorio']),
      fechaDiagnostico: DateTime.parse(json['fecha_diagnostico']),
      idResultadoDiagnostico: json['id_resultado_diagnostico'],
      densidadParasitariaVivaxEas: json['densidad_parasitaria_vivax_eas'],
      densidadParasitariaVivaxEss: json['densidad_parasitaria_vivax_ess'],
      densidadParasitariaFalciparumEas: json['densidad_parasitaria_falciparum_eas'],
      densidadParasitariaFalciparumEss: json['densidad_parasitaria_falciparum_ess'],
      idSilaisDiagnostico: json['id_silais_diagnostico'],
      idEstablecimientoDiagnostico: json['id_establecimiento_diagnostico'],
      existenciaReinfeccion: json['existencia_reinfeccion'],
      eventoSaludExtranjero: json['evento_salud_extranjero'],
      idPaisOcurrenciaEventoSalud: json['id_pais_ocurrencia_evento_salud'],
      usuarioCreacion: json['usuario_creacion'],
      fechaCreacion: DateTime.parse(json['fecha_creacion']),
      usuarioModificacion: json['usuario_modificacion'],
      fechaModificacion: json['fecha_modificacion'] != null
          ? DateTime.parse(json['fecha_modificacion'])
          : null,
      activo: json['activo'],
    );
  }

  // Método para convertir el objeto Captacion a un JSON
  Map<String, dynamic> toJson() {
    return {
      'id_captacion': idCaptacion,
      'id_evento_salud': idEventoSalud,
      'id_persona': idPersona,
      'id_maternidad': idMaternidad,
      'semana_gestacion': semanaGestacion,
      'trabajador_salud': trabajadorSalud,
      'id_silais_trabajador': idSilaisTrabajador,
      'id_establecimiento_trabajador': idEstablecimientoTrabajador,
      'tiene_comorbilidades': tieneComorbilidades,
      'id_comorbilidades': idComorbilidades,
      'nombre_jefe_familia': nombreJefeFamilia,
      'telefono_referencia': telefonoReferencia,
      'id_lugar_captacion': idLugarCaptacion,
      'id_condicion_persona': idCondicionPersona,
      'fecha_captacion': fechaCaptacion.toIso8601String(),
      'semana_epidemiologica': semanaEpidemiologica,
      'id_silais_captacion': idSilaisCaptacion,
      'id_establecimiento_captacion': idEstablecimientoCaptacion,
      'id_persona_captacion': idPersonaCaptacion,
      'id_sitio_exposicion': idSitioExposicion,
      'latitud_ocurrencia': latitudOcurrencia,
      'longitud_ocurrencia': longitudOcurrencia,
      'presenta_sintomas': presentaSintomas,
      'fecha_inicio_sintomas': fechaInicioSintomas.toIso8601String(),
      'id_sintomas': idSintomas,
      'fue_referido': fueReferido,
      'id_silais_traslado': idSilaisTraslado,
      'id_establecimiento_traslado': idEstablecimientoTraslado,
      'es_viajero': esViajero,
      'fecha_ingreso_pais': fechaIngresoPais.toIso8601String(),
      'id_lugar_ingreso_pais': idLugarIngresoPais,
      'direccion_ocurrencia': direccionOcurrencia,
      'observaciones_captacion': observacionesCaptacion,
      'id_puesto_notificacion': idPuestoNotificacion,
      'no_clave': noClave,
      'no_lamina': noLamina,
      'toma_muestra': tomaMuestra,
      'tipobusqueda': tipoBusqueda,
      'id_diagnostico': idDiagnostico,
      'fecha_toma_muestra': fechaTomaMuestra.toIso8601String(),
      'fecha_recepcion_laboratorio': fechaRecepcionLaboratorio.toIso8601String(),
      'fecha_diagnostico': fechaDiagnostico.toIso8601String(),
      'id_resultado_diagnostico': idResultadoDiagnostico,
      'densidad_parasitaria_vivax_eas': densidadParasitariaVivaxEas,
      'densidad_parasitaria_vivax_ess': densidadParasitariaVivaxEss,
      'densidad_parasitaria_falciparum_eas': densidadParasitariaFalciparumEas,
      'densidad_parasitaria_falciparum_ess': densidadParasitariaFalciparumEss,
      'id_silais_diagnostico': idSilaisDiagnostico,
      'id_establecimiento_diagnostico': idEstablecimientoDiagnostico,
      'existencia_reinfeccion': existenciaReinfeccion,
      'evento_salud_extranjero': eventoSaludExtranjero,
      'id_pais_ocurrencia_evento_salud': idPaisOcurrenciaEventoSalud,
      'usuario_creacion': usuarioCreacion,
      'fecha_creacion': fechaCreacion.toIso8601String(),
      'usuario_modificacion': usuarioModificacion,
      'fecha_modificacion': fechaModificacion != null
          ? fechaModificacion!.toIso8601String()
          : null,
      'activo': activo,
    };
  }
}