import 'package:json_annotation/json_annotation.dart';
part 'horas.g.dart';

@JsonSerializable()
class Horas {
  Horas(
    this.Ri,
  );
  // ignore: non_constant_identifier_names
  String? Ri;

  factory Horas.fromJson(Map<String, dynamic> json) => _$HorasFromJson(json);
  Map<String, dynamic> toJson() => _$HorasToJson(this);
}
