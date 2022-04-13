import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/horas.dart';
import '../models/logcitas.dart';
import '../models/base1.dart';

// class method: horario general
class RangoDeHora {
  Future<List<Horas>> mishoras() async {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/horarios/');
    var response = await http.post(
      url,
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

// class method: resumen de lo agendado
class FutureResumen {
  Future<List<LogCitas>> miresumen() async {
    var url = Uri.parse('https://walther-function-3.azurewebsites.net/miresumen/');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response.body);
      // ignore: non_constant_identifier_names
      List<LogCitas> Citas = data.map((d) => LogCitas.fromJson(d)).toList();
      return Citas;
    } else {
      throw Exception("error en la api");
    }
  }
}

// class method: buscar placa
class BuscarPlaca {
  Future<List<Base1>> buscarrequest(String arg) async {
    if (arg != "") {
      var url = Uri.parse('https://walther-function-3.azurewebsites.net/dato/');
      var response = await http.post(
        url,
        body: convert.jsonEncode({'data': '$arg'}),
        headers: {"Content-Type": "application/json"},
      );
      if ((response.statusCode == 200) && ((convert.jsonDecode(response.body) is List<dynamic>))) {
        List<dynamic> data = convert.jsonDecode(response.body);
        // ignore: non_constant_identifier_names
        List<Base1> Placas = data.map((e) => Base1.fromJson(e)).toList();
        return Placas;
      } else {
        List<Base1> Placas = [Base1(0, '', '', '', '', '', '', '', '', '', '', '', '')];
        return Placas;
      }
    } else {
      throw Exception("error en la api");
    }
  }
}

// class method: buscar Cita
class BuscarCita {
  Future<List<LogCitas>> buscarrequest(String arg) async {
    if (arg != "") {
      var url = Uri.parse('https://walther-function-3.azurewebsites.net/buscarcita/');
      var response = await http.post(
        url,
        body: convert.jsonEncode({'data': '$arg'}),
        headers: {"Content-Type": "application/json"},
      );
      if ((response.statusCode == 200) && ((convert.jsonDecode(response.body) is List<dynamic>))) {
        List<dynamic> data = convert.jsonDecode(response.body);
        // ignore: non_constant_identifier_names
        List<LogCitas> Placas = data.map((e) => LogCitas.fromJson(e)).toList();
        return Placas;
      } else {
        throw Exception("error en la api");
      }
    } else {
      throw Exception("error en la api");
    }
  }
}
