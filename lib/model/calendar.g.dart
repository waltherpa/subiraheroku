// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) => Calendar(
      json['id_cal'] as int,
      json['Sede'] as String,
      json['Fecha'] as String,
      json['Hora'] as String,
      json['Placa'] as String,
      json['Idlog'] as int,
    );

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id_cal': instance.id_cal,
      'Sede': instance.Sede,
      'Fecha': instance.Fecha,
      'Hora': instance.Hora,
      'Placa': instance.Placa,
      'Idlog': instance.Idlog,
    };
