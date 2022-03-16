// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuarios _$UsuariosFromJson(Map<String, dynamic> json) => Usuarios(
      json['id_us'] as int,
      json['Nombre'] as String,
      json['Clave'] as String,
      json['Categoria'] as String,
    );

Map<String, dynamic> _$UsuariosToJson(Usuarios instance) => <String, dynamic>{
      'id_us': instance.id_us,
      'Nombre': instance.Nombre,
      'Clave': instance.Clave,
      'Categoria': instance.Categoria,
    };
