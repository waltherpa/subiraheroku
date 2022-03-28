import 'package:json_annotation/json_annotation.dart';
part 'calendar.g.dart';

@JsonSerializable()
class Calendar {
  Calendar(
    this.id_cal,
    this.Sede,
    this.Fecha,
    this.Hora,
    this.Placa,
    this.Idlog,
  );

  // ignore: non_constant_identifier_names
  int id_cal;
  // ignore: non_constant_identifier_names
  String Sede;
  // ignore: non_constant_identifier_names
  String Fecha;
  // ignore: non_constant_identifier_names
  String Hora;
  // ignore: non_constant_identifier_names
  String Placa;
  // ignore: non_constant_identifier_names
  int Idlog;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
