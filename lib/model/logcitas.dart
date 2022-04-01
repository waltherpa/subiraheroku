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

  int id_lg;
  String Usuario;
  String Fecha;
  String Hora;
  String Placa;
  String Modelo;
  String Nveh;
  String Nombre;
  String Documento;
  String Correo;
  String Telefono;
  String TipoProblema;
  String SuptipoProblema;
  String TipoLlamada;
  String Sede;
  String Comentarios;
  String FechaRegistro;

  factory LogCitas.fromJson(Map<String, dynamic> json) =>
      _$LogCitasFromJson(json);
  Map<String, dynamic> toJson() => _$LogCitasToJson(this);
}
