// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logcitas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogCitas _$LogCitasFromJson(Map<String, dynamic> json) => LogCitas(
      json['id_lg'] as int,
      Sedes.fromJson(json['sedes'] as Map<String, dynamic>),
      json['Fecha'] as String,
      json['Hora'] as String,
      json['Ncita'] as String,
      json['EstadoCita'] as String,
      Base1.fromJson(json['base1'] as Map<String, dynamic>),
      json['TipoProblema'] as String,
      json['SubtipoProblema'] as String,
      json['TipoLlamada'] as String,
      Usuarios.fromJson(json['usuarios'] as Map<String, dynamic>),
      json['Asesor'] as String,
      json['Comentarios'] as String,
    );

Map<String, dynamic> _$LogCitasToJson(LogCitas instance) => <String, dynamic>{
      'id_lg': instance.id_lg,
      'sedes': instance.sedes,
      'Fecha': instance.Fecha,
      'Hora': instance.Hora,
      'Ncita': instance.Ncita,
      'EstadoCita': instance.EstadoCita,
      'base1': instance.base1,
      'TipoProblema': instance.TipoProblema,
      'SubtipoProblema': instance.SubtipoProblema,
      'TipoLlamada': instance.TipoLlamada,
      'usuarios': instance.usuarios,
      'Asesor': instance.Asesor,
      'Comentarios': instance.Comentarios,
    };
