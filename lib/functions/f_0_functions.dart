import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/horas.dart';

// login method
Future identificarusuario({TextEditingController? clave, TextEditingController? usuario}) async {
  if (usuario?.text != "" && clave?.text != "") {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/login/');
    var u = usuario!.text;
    var c = clave!.text;
    var response = await http.post(
      url,
      body: convert.jsonEncode({'usuario': '$u', 'clave': '$c'}),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      var l = convert.jsonDecode(response.body);
      List results = [];
      results.add(l);
      return results;
    }
  } else {
    throw Exception("error en la api");
  }
}

// today method
String fechaDeHoy() {
  DateTime? pickedDate = DateTime.now();
  if (pickedDate != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    return formattedDate;
  } else {
    return "seleccione fecha";
  }
}

// date picker method
void onDateChanged(context, TextEditingController dateinput) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101));

  if (pickedDate != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    dateinput.text = formattedDate;
  } else {
    dateinput.text = "seleccione fecha";
  }
}

// funcion envuelta en una clase --- horas disponibles
class FutureHoraDisponible {
  Future<List<Horas>> mishoras(List<String> listadedatos) async {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/horalibre/');
    var response = await http.post(
      url,
      body: convert.jsonEncode({'sede': '${listadedatos[0]}', 'fecha': '${listadedatos[1]}'}),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response.body);
      // ignore: non_constant_identifier_names
      List<Horas> TheHoras = data.map((d) => Horas.fromJson(d)).toList();
      return TheHoras;
    } else {
      throw Exception("error en la api");
    }
  }
}

// guardar datos
Future<List?> guardaragenda({
  String? usuario,
  String? fecha,
  String? hora,
  String? placa,
  String? modelo,
  String? nveh,
  String? nombre,
  String? doc,
  String? correo,
  String? telefono,
  String? desple1,
  String? desple2,
  String? desple3,
  String? sede,
  String? comentario,
  String? fecharegistro,
}) async {
  if (usuario != "" || fecha != "" || hora != "" || hora != "vacio") {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/agendar/');
    var response = await http.post(
      url,
      body: convert.jsonEncode({
        'usuario': '$usuario',
        'fecha': '$fecha',
        'hora': '$hora',
        'placa': '$placa',
        'modelo': '$modelo',
        'nveh': '$nveh',
        'nombre': '$nombre',
        'doc': '$doc',
        'correo': '$correo',
        'telefono': '$telefono',
        'des1': '$desple1',
        'des2': '$desple2',
        'des3': '$desple3',
        'sede': '$sede',
        'comentario': '$comentario',
        'fecharegistro': '$fecharegistro'
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      var l = convert.jsonDecode(response.body);
      List results = [];
      results.add(l);
      return results;
    }
  } else {
    throw Exception("error en la api");
  }
  return [];
}

// ---------------------------------------------------------------
//                        planner table
// ---------------------------------------------------------------
//lista de rango de 15 fechas como texto
List<String> listadefechas() {
  DateTime date1 = DateTime.now();
  List<String> dias = [];
  dias.add(DateFormat('dd-MM-yyyy').format(date1));
  for (int i = 0; i < 14; i++) {
    dias.add(DateFormat('dd-MM-yyyy').format(date1.add(Duration(days: i + 1))));
  }
  return dias;
}

// trasforma string in dia de la semana
String diadelasemana(String _data) {
  List<String> _dl = _data.split("-");
  DateTime dt = DateTime.parse('${_dl[2]}-${_dl[1]}-${_dl[0]}');
  Map<int, String> semana = {
    1: "Lunes",
    2: "Martes",
    3: "Miercoles",
    4: "Jueves",
    5: "Viernes",
    6: "Sabado",
    7: "Domingo"
  };
  return semana[dt.weekday]!;
}

// login
Future borrar(int id) async {
  var url = Uri.parse('https://walther-function-3.azurewebsites.net/borrame/');
  var response = await http.post(
    url,
    body: convert.jsonEncode({'id': '$id'}),
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) {
    var l = convert.jsonDecode(response.body);
    List results = [];
    results.add(l);
    return results;
  }
}
