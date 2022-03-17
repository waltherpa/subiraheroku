import 'package:json_annotation/json_annotation.dart';
import 'base1.dart';
import 'usuarios.dart';
import 'sedes.dart';
part 'logcitas.g.dart';

@JsonSerializable()
class LogCitas {
  LogCitas(
    this.id_lg,
    this.sedes,
    this.Fecha,
    this.Hora,
    this.Ncita,
    this.EstadoCita,
    this.base1,
    this.TipoProblema,
    this.SubtipoProblema,
    this.TipoLlamada,
    this.usuarios,
    this.Asesor,
    this.Comentarios,
  );

  // ignore: non_constant_identifier_names
  int id_lg;
  // ignore: non_constant_identifier_names
  Sedes sedes;
  // ignore: non_constant_identifier_names
  String Fecha;
  // ignore: non_constant_identifier_names
  String Hora;
  // ignore: non_constant_identifier_names
  String Ncita;
  // ignore: non_constant_identifier_names
  String EstadoCita;
  // ignore: non_constant_identifier_names
  Base1 base1;
  // ignore: non_constant_identifier_names
  String TipoProblema;
  // ignore: non_constant_identifier_names
  String SubtipoProblema;
  // ignore: non_constant_identifier_names
  String TipoLlamada;
  // ignore: non_constant_identifier_names
  Usuarios usuarios;
  // ignore: non_constant_identifier_names
  String Asesor;
  // ignore: non_constant_identifier_names
  String Comentarios;

  factory LogCitas.fromJson(Map<String, dynamic> json) =>
      _$LogCitasFromJson(json);
  Map<String, dynamic> toJson() => _$LogCitasToJson(this);
}
