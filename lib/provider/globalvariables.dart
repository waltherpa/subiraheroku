import 'package:citas1/provider/river_clases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../function/fbase1.dart';

// recordar usuario
final riverUsuario = ChangeNotifierProvider((ref) => User());

//selecctor de fecha
final riverfecha = ChangeNotifierProvider((ref) => Fecha());

//selecctor de fecha
final riverhora = ChangeNotifierProvider((ref) => Hora());

// change notifier
final drop1 = ChangeNotifierProvider((ref) => Dd1());

// change notifier agendamiento
final agen = ChangeNotifierProvider((ref) => Agendamiento());

// future notifier
// final gagen = Provider((ref) => GuardarAgenda());
// final respuestaf = FutureProvider<String>((ref) async {
//   final r = ref.read(gagen);
//   return r.get('sth');
// });

// final ffutureProvider = FutureProvider<String>((ref) async {
//   return GuardarAgenda().get('ss');
// });

// change notifier drops2
final drop2 = ChangeNotifierProvider((ref) => Dd2());
