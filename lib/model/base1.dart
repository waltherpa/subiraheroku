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
  String? NROMOTOR_VEH;
  String? CHASIS_VEH;
  String? CLIENTE;
  String? EMAIL;
  String? PERSONA_CONTACTO;
  String? COD_CLIENTE;
  String? PLACA_VEH_TARJETA;
  String? VERSION_MODELO;
  String? COLOR;
  String? SERIE;
  String? TELEFONO1;
  String? BASE;

  factory Base1.fromJson(Map<String, dynamic> json) => _$Base1FromJson(json);
  Map<String, dynamic> toJson() => _$Base1ToJson(this);
}
