import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:citas1/model/base1.dart';

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
