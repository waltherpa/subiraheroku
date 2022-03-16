import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:citas1/model/base1.dart';
import 'package:citas1/model/usuarios.dart';

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
