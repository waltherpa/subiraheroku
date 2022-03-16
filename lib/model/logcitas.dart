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

  int id_lg;
  Sedes sedes;
  String Fecha;
  String Hora;
  String Ncita;
  String EstadoCita;
  Base1 base1;
  String TipoProblema;
  String SubtipoProblema;
  String TipoLlamada;
  Usuarios usuarios;
  String Asesor;
  String Comentarios;

  factory LogCitas.fromJson(Map<String, dynamic> json) =>
      _$LogCitasFromJson(json);
  Map<String, dynamic> toJson() => _$LogCitasToJson(this);
}
