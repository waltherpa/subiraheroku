import 'package:json_annotation/json_annotation.dart';
part 'base1.g.dart';

@JsonSerializable()
class Base1 {
  Base1(
    this.id,
    this.NROMOTOR_VEH,
    this.CHASIS_VEH,
    this.CLIENTE,
    this.EMAIL,
    this.PERSONA_CONTACTO,
    this.COD_CLIENTE,
    this.PLACA_VEH_TARJETA,
    this.VERSION_MODELO,
    this.COLOR,
    this.SERIE,
    this.TELEFONO1,
    this.BASE,
  );

  int id;
  // ignore: non_constant_identifier_names
  String? NROMOTOR_VEH;
  // ignore: non_constant_identifier_names
  String? CHASIS_VEH;
  // ignore: non_constant_identifier_names
  String? CLIENTE;
  // ignore: non_constant_identifier_names
  String? EMAIL;
  // ignore: non_constant_identifier_names
  String? PERSONA_CONTACTO;
  // ignore: non_constant_identifier_names
  String? COD_CLIENTE;
  // ignore: non_constant_identifier_names
  String? PLACA_VEH_TARJETA;
  // ignore: non_constant_identifier_names
  String? VERSION_MODELO;
  // ignore: non_constant_identifier_names
  String? COLOR;
  // ignore: non_constant_identifier_names
  String? SERIE;
  // ignore: non_constant_identifier_names
  String? TELEFONO1;
  // ignore: non_constant_identifier_names
  String? BASE;

  factory Base1.fromJson(Map<String, dynamic> json) => _$Base1FromJson(json);
  Map<String, dynamic> toJson() => _$Base1ToJson(this);
}
