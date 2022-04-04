import 'package:citas1/model/base1.dart';
import 'package:citas1/model/logcitas.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../function/fbase1.dart';
import '../model/horas.dart';

// recordar usuario
final riverUsuario = ChangeNotifierProvider((ref) => User());

//selecctor de fecha
final riverfecha = ChangeNotifierProvider((ref) => Fecha());

//selecctor de hora
final riverhora = ChangeNotifierProvider((ref) => Hora());

// change notifier
final drop1 = ChangeNotifierProvider((ref) => Dd1());

// change notifier agendamiento
final agen = ChangeNotifierProvider((ref) => Agendamiento());

// change notifier drops2
final drop2 = ChangeNotifierProvider((ref) => Dd2());

// change notifier drop3---- horas disponibles
final drop3 = ChangeNotifierProvider((ref) => Dd3());

// future notifier mi LogCitas ---RESUMEN ---PLANNER
// ignore: non_constant_identifier_names
// final FMiResumen = Provider((ref) => FutureResumen());
// final resf = FutureProvider.autoDispose<List<LogCitas>>((ref) async {
//   final r = ref.watch(FMiResumen);
//   return r.miresumen();
// });

// final FMiResumen = Provider((ref) => FutureResumen());
final resf = FutureProvider.autoDispose<List<LogCitas>>((ref) async {
  // final r = ref.watch(FMiResumen);
  return FutureResumen().miresumen();
});

// Future horas de trabajo:
// ignore: non_constant_identifier_names
final FHorasT = Provider((ref) => RangoDeHora());
final horasf = FutureProvider.autoDispose<List<Horas>>((ref) async {
  final r = ref.read(FHorasT);
  return r.mishoras();
});

// repositorio de horas de trabajo para armar la tabla
final horastrabajo = ChangeNotifierProvider((ref) => HorariosdeTRabajo());

// future notifier mi placa
// ignore: non_constant_identifier_names
final FMiPlaca = Provider((ref) => BuscarPlaca());
final presf = FutureProvider.family<List<Base1>, String>((ref, placa) async {
  final r = ref.read(FMiPlaca);
  return r.buscarrequest(placa);
});

// change notifier thema
// ignore: non_constant_identifier_names
final SedeProv = ChangeNotifierProvider((ref) => MiSede());
