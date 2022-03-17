import 'package:json_annotation/json_annotation.dart';
import 'logcitas.dart';
part 'calendar.g.dart';

@JsonSerializable()
class Calendar {
  Calendar(
    this.id_cal,
    this.Fecha,
    this.Hora,
    this.Slot1,
    this.Slot2,
    this.Idlog,
  );

  // ignore: non_constant_identifier_names
  int id_cal;
  // ignore: non_constant_identifier_names
  String Fecha;
  // ignore: non_constant_identifier_names
  String Hora;
  // ignore: non_constant_identifier_names
  int Slot1;
  // ignore: non_constant_identifier_names
  int Slot2;
  // ignore: non_constant_identifier_names
  LogCitas Idlog;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
