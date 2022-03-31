import 'dart:convert' as convert;
import 'package:citas1/model/logcitas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:citas1/model/base1.dart';
import 'package:intl/intl.dart';
import '../provider/globalvariables.dart';
import '../provider/river_clases.dart';

class BuscarPlaca {
  Future<List<Base1>> buscarrequest(String arg) async {
    if (arg != "") {
      var url = Uri.parse('https://walther-function-3.azurewebsites.net/dato/');
      var response = await http.post(
        url,
        body: convert.jsonEncode({'data': '$arg'}),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = convert.jsonDecode(response.body);
        List<Base1> Placas = data.map((e) => Base1.fromJson(e)).toList();
        return Placas;
      } else {
        throw Exception("error en la api");
      }
    } else {
      throw Exception("error en la api");
    }
  }
}

// login
Future identificarusuario(
    {TextEditingController? clave, TextEditingController? usuario}) async {
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

// function of date
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

// function of time
void onTimeChanged(context, TextEditingController timeinput) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.input,
  );
  if (pickedTime != null) {
    int hour = pickedTime.hour;
    int minute = pickedTime.minute;
    minute = (minute / 10).round() * 10;
    if (hour >= 7 && hour < 19) {
      if (minute == 0) {
        timeinput.text = '$hour:$minute$minute';
      } else {
        timeinput.text = '$hour:$minute';
      }
    } else {
      timeinput.text = "hora inhabilitada";
    }
  } else {
    timeinput.text = "seleccione hora";
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
  String? estadocita,
  String? comentario,
}) async {
  if (usuario != "" || fecha != "" || hora != "") {
    var url =
        Uri.parse('https://walther-function-3.azurewebsites.net/agendar/');
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
        'estadocita': '$estadocita',
        'comentario': '$comentario',
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

// funcion envuelta en una clase --- resumen
class FutureResumen {
  Future<List<LogCitas>> miresumen() async {
    var url =
        Uri.parse('https://walther-function-3.azurewebsites.net/miresumen/');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response.body);
      List<LogCitas> Citas = data.map((d) => LogCitas.fromJson(d)).toList();
      print(Citas[1].Placa);
      return Citas;
    } else {
      throw Exception("error en la api");
    }
  }
}
