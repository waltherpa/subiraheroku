import 'package:json_annotation/json_annotation.dart';
part 'usuarios.g.dart';

@JsonSerializable()
class Usuarios {
  Usuarios(
    this.id_us,
    this.Nombre,
    this.Clave,
    this.Categoria,
  );

  // ignore: non_constant_identifier_names
  int id_us;
  // ignore: non_constant_identifier_names
  String Nombre;
  // ignore: non_constant_identifier_names
  String Clave;
  // ignore: non_constant_identifier_names
  String Categoria;

  factory Usuarios.fromJson(Map<String, dynamic> json) =>
      _$UsuariosFromJson(json);
  Map<String, dynamic> toJson() => _$UsuariosToJson(this);
}
