import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:citas1/model/base1.dart';
import 'package:citas1/model/usuarios.dart';
import 'package:intl/intl.dart';

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
onDateChanged(context, TextEditingController dateinput) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101));

  if (pickedDate != null) {
    print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    print(
        formattedDate); //formatted date output using intl package =>  2021-03-16
    // setState(() {
    dateinput.text = formattedDate; //set output date to TextField value.
    // });
  } else {
    print("Date is not selected");
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
    print(pickedTime.format(context)); //output 10:51 PM
    DateTime parsedTime =
        DateFormat.jm().parse(pickedTime.format(context).toString());
    //converting to DateTime so that we can further format on different pattern.
    print(parsedTime); //output 1970-01-01 22:53:00.000
    String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
    print(formattedTime); //output 14:59:00
    // setState(() {
    timeinput.text = formattedTime; //set the value of text field.
    // });
  } else {
    print("Time is not selected");
  }
}
