import 'package:citas1/pages/planner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../common/widgets.dart';
import '../function/fbase1.dart';
import '../provider/globalvariables.dart';
import '../provider/river_clases.dart';

class Agenda extends ConsumerWidget {
  Agenda({Key? key}) : super(key: key);
  TextEditingController ctlr_usuario = TextEditingController(); //provided
  TextEditingController ctlr_fecha = TextEditingController(); //provided
  TextEditingController ctlr_hora = TextEditingController(); //provided
  TextEditingController ctlr_placa = TextEditingController();
  TextEditingController ctlr_modelo = TextEditingController();
  TextEditingController ctlr_nveh = TextEditingController();
  // desplegable 1 //provided
  // desplegable 2 //provided
  // desplegable 3 //provided
  TextEditingController ctlr_nombre = TextEditingController();
  TextEditingController ctlr_doc = TextEditingController();
  TextEditingController ctlr_correo = TextEditingController();
  TextEditingController ctlr_telefono = TextEditingController();
  TextEditingController ctlr_comentario = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cita'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // quien agenda
              Consumer(
                builder: ((context, ref, _) {
                  final val = ref.watch(riverUsuario);
                  ctlr_usuario.text = val.u;
                  return CampoDeTexto(
                    label: "Usuario",
                    width: 150,
                    height: 50,
                    controlador: ctlr_usuario,
                  );
                }),
              ),
              // fecha
              CampoFechaHora(
                label: 'Fecha',
                width: 150,
                height: 50,
                controller: ctlr_fecha,
                myfunction: () {
                  onDateChanged(context, ctlr_fecha);
                  ref.read(riverfecha.notifier).setFecha(ctlr_fecha.text);
                },
              ),
              // hora
              CampoFechaHora(
                label: 'Hora',
                width: 150,
                height: 50,
                controller: ctlr_hora,
                myfunction: () {
                  onTimeChanged(context, ctlr_hora);
                  ref.read(riverhora.notifier).setHora(ctlr_hora.text);
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // placa
              CampoDeTexto(
                label: 'Placa',
                width: 150,
                height: 50,
                controlador: ctlr_placa,
              ),
              // modelo
              CampoDeTexto(
                label: 'Modelo',
                width: 150,
                height: 50,
                controlador: ctlr_modelo,
              ),
              // numero de vehiculo
              CampoDeTexto(
                label: 'N Veh.',
                width: 150,
                height: 50,
                controlador: ctlr_nveh,
              ),
              // tipo de problema
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                return Desplegable(
                    opciones: val1.opciones1, opcioninicial: val1.inivalue1);
              })),
              // subtipo de problema
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                return Desplegable(
                    opciones: val1.opciones2, opcioninicial: val1.inivalue2);
              })),
              // tipo de llamada
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                return Desplegable(
                    opciones: val1.opciones3, opcioninicial: val1.inivalue3);
              })),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // nombre cliente
              CampoDeTexto(
                label: 'Nombre',
                width: 150,
                height: 50,
                controlador: ctlr_nombre,
              ),
              // documento
              CampoDeTexto(
                label: 'Documento',
                width: 150,
                height: 50,
                controlador: ctlr_doc,
              ),
              // correo
              CampoDeTexto(
                label: 'Correo',
                width: 150,
                height: 50,
                controlador: ctlr_correo,
              ),
              // telefono
              CampoDeTexto(
                label: 'Telefono',
                width: 150,
                height: 50,
                controlador: ctlr_telefono,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // comentarios
              Comentarios(
                label: 'Comentarios',
                width: 630,
                height: 150,
                controller: ctlr_comentario,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Boton(
                label: 'Salir',
                width: 150,
                height: 50,
                ruta: '/planner',
              ),
              Boton(
                label: 'Guardar',
                width: 150,
                height: 50,
                ruta: '/planner',
                funcion: GuardarAgenda,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
