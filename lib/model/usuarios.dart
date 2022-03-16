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

  int id_us;
  String Nombre;
  String Clave;
  String Categoria;

  factory Usuarios.fromJson(Map<String, dynamic> json) =>
      _$UsuariosFromJson(json);
  Map<String, dynamic> toJson() => _$UsuariosToJson(this);
}
