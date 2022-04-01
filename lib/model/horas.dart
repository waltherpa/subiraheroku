import 'package:json_annotation/json_annotation.dart';
part 'horas.g.dart';

@JsonSerializable()
class Horas {
  Horas(
    this.Rh,
  );
  // ignore: non_constant_identifier_names
  String? Rh;

  factory Horas.fromJson(Map<String, dynamic> json) => _$HorasFromJson(json);
  Map<String, dynamic> toJson() => _$HorasToJson(this);
}
