import 'package:citas1/model/base1.dart';
import 'package:citas1/model/logcitas.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
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

// change notifier drops2
final drop2 = ChangeNotifierProvider((ref) => Dd2());

// future notifier mi resumen
final FMiResumen = Provider((ref) => FutureResumen());
final resf = FutureProvider<List<LogCitas>>((ref) async {
  final r = ref.read(FMiResumen);
  return r.miresumen();
});

// future notifier mi resumen
final FMiPlaca = Provider((ref) => BuscarPlaca());
final presf = FutureProvider.family<List<Base1>, String>((ref, placa) async {
  final r = ref.read(FMiPlaca);
  return r.buscarrequest(placa);
});
