import 'package:citas1/model/base1.dart';
import 'package:citas1/model/logcitas.dart';
import 'package:citas1/provider/river_clases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
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

// future notifier mi LogCitas
final FMiResumen = Provider((ref) => FutureResumen());
final resf = FutureProvider.autoDispose<List<LogCitas>>((ref) async {
  final r = ref.read(FMiResumen);
  return r.miresumen();
});

// Future notifier drops3 : horas diponibles // entra en un loop y no suelta la información
// final FMishoras = Provider((ref) => FutureHoraDisponible());
// final horasf =
//     FutureProvider.family<List<Horas>, List<String>>((ref, data) async {
//   final r = ref.read(FMishoras);
//   return r.mishoras(data);
// });

// future notifier mi placa
final FMiPlaca = Provider((ref) => BuscarPlaca());
final presf = FutureProvider.family<List<Base1>, String>((ref, placa) async {
  final r = ref.read(FMiPlaca);
  return r.buscarrequest(placa);
});

// change notifier thema
final SedeProv = ChangeNotifierProvider((ref) => MiSede());
