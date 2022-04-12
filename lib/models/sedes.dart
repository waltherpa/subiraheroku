import 'package:json_annotation/json_annotation.dart';
part 'sedes.g.dart';

@JsonSerializable()
class Sedes {
  Sedes(
    this.id_sd,
    this.Sede,
  );

  // ignore: non_constant_identifier_names
  int id_sd;
  // ignore: non_constant_identifier_names
  String Sede;

  factory Sedes.fromJson(Map<String, dynamic> json) => _$SedesFromJson(json);
  Map<String, dynamic> toJson() => _$SedesToJson(this);
}
