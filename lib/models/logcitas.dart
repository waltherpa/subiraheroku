import 'package:json_annotation/json_annotation.dart';
part 'logcitas.g.dart';

@JsonSerializable()
class LogCitas {
  LogCitas(
    this.id_lg,
    this.Usuario,
    this.Fecha,
    this.Hora,
    this.Placa,
    this.Modelo,
    this.Nveh,
    this.Nombre,
    this.Documento,
    this.Correo,
    this.Telefono,
    this.TipoProblema,
    this.SuptipoProblema,
    this.TipoLlamada,
    this.Sede,
    this.Comentarios,
    this.FechaRegistro,
  );

  // ignore: non_constant_identifier_names
  int id_lg;
  // ignore: non_constant_identifier_names
  String Usuario;
  // ignore: non_constant_identifier_names
  String Fecha;
  // ignore: non_constant_identifier_names
  String Hora;
  // ignore: non_constant_identifier_names
  String Placa;
  // ignore: non_constant_identifier_names
  String Modelo;
  // ignore: non_constant_identifier_names
  String Nveh;
  // ignore: non_constant_identifier_names
  String Nombre;
  // ignore: non_constant_identifier_names
  String Documento;
  // ignore: non_constant_identifier_names
  String Correo;
  // ignore: non_constant_identifier_names
  String Telefono;
  // ignore: non_constant_identifier_names
  String TipoProblema;
  // ignore: non_constant_identifier_names
  String SuptipoProblema;
  // ignore: non_constant_identifier_names
  String TipoLlamada;
  // ignore: non_constant_identifier_names
  String Sede;
  // ignore: non_constant_identifier_names
  String Comentarios;
  // ignore: non_constant_identifier_names
  String FechaRegistro;

  factory LogCitas.fromJson(Map<String, dynamic> json) => _$LogCitasFromJson(json);
  Map<String, dynamic> toJson() => _$LogCitasToJson(this);
}
