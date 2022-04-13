import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './p_2_clases.dart';
import '../models/horas.dart';
import '../models/logcitas.dart';
import '../models/base1.dart';
import '../functions/f_1_clases.dart';

// repositorio: usuario
final riverUsuario = ChangeNotifierProvider((ref) => User());

// repositorio: de horas de trabajo para armar la tabla
final riverHorasTrabajo = ChangeNotifierProvider((ref) => HorariosdeTRabajo());

// repositorio: sede
// ignore: non_constant_identifier_names
final riverSede = ChangeNotifierProvider((ref) => MiSede());

// repositorio: horario general
// ignore: non_constant_identifier_names
final bridgeHoras = Provider((ref) => RangoDeHora());
final riverHoras = FutureProvider.autoDispose<List<Horas>>((ref) async {
  final r = ref.read(bridgeHoras);
  return r.mishoras();
});

// future notifier mi LogCitas ---RESUMEN ---PLANNER
// ignore: non_constant_identifier_names
final FMiResumen = Provider((ref) => FutureResumen());
final riverResumen = FutureProvider.autoDispose<List<LogCitas>>((ref) async {
  final r = ref.watch(FMiResumen);
  return r.miresumen();
});

// repositorio: drop1---- tipo de problema
final drop1 = ChangeNotifierProvider((ref) => Dd1());

// repositorio: drop3---- horas disponibles
final drop3 = ChangeNotifierProvider((ref) => Dd3());

//reporsitorio: selecctor de fecha
final riverFecha = ChangeNotifierProvider((ref) => Fecha());

//reporsitorio: datos de lo agendado
final riverAgendar = ChangeNotifierProvider((ref) => Agendamiento());

// future notifier mi placa
// ignore: non_constant_identifier_names
final FMiPlaca = Provider.autoDispose((ref) => BuscarPlaca());
final riverPlaca = FutureProvider.family.autoDispose<List<Base1>, String>((ref, placa) async {
  final r = ref.read(FMiPlaca);
  return r.buscarrequest(placa);
});

// future notifier mi cita
// ignore: non_constant_identifier_names
final FMiCita = Provider.autoDispose((ref) => BuscarCita());
final riverCita = FutureProvider.family.autoDispose<List<LogCitas>, String>((ref, placa) async {
  final r = ref.read(FMiCita);
  return r.buscarrequest(placa);
});
