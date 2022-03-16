// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) => Calendar(
      json['id_cal'] as int,
      json['Fecha'] as String,
      json['Hora'] as String,
      json['Slot1'] as int,
      json['Slot2'] as int,
      LogCitas.fromJson(json['Idlog'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id_cal': instance.id_cal,
      'Fecha': instance.Fecha,
      'Hora': instance.Hora,
      'Slot1': instance.Slot1,
      'Slot2': instance.Slot2,
      'Idlog': instance.Idlog,
    };
