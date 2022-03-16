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

  int id_cal;
  String Fecha;
  String Hora;
  int Slot1;
  int Slot2;
  LogCitas Idlog;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
