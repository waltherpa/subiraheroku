import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:citas1/model/base1.dart';
import 'package:intl/intl.dart';
import 'dart:math';

Future buscarrequest(String arg) async {
  if (arg != "") {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/dato/');
    var response = await http.post(
      url,
      body: convert.jsonEncode({'data': '$arg'}),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List l = convert.jsonDecode(response.body);
      List<Base1> results = [];
      for (final e in l) {
        results.add(Base1.fromJson(e));
      }
      return l.toList();
    }
  } else {
    throw Exception("error en la api");
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
      timeinput.text = '$hour:$minute';
    } else {
      timeinput.text = "hora inabilitada";
    }
  } else {
    timeinput.text = "seleccione hora";
  }
}

// save agenda
void GuardarAgenda(
//   TextEditingController ctlr_usuario,
//   TextEditingController ctlr_fecha,
//   TextEditingController ctlr_hora,
//   TextEditingController ctlr_placa,
//   TextEditingController ctlr_modelo,
//   TextEditingController ctlr_nveh,
//   TextEditingController ctlr_nombre,
//   TextEditingController ctlr_doc,
//   TextEditingController ctlr_correo,
//   TextEditingController ctlr_telefono,
//   TextEditingController ctlr_comentario,
    ) {
  print('este es el dato de y d');
}
