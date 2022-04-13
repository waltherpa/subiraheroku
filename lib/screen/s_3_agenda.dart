import 'package:citas_2/functions/p_3_variable.dart';
import 'package:citas_2/models/base1.dart';
import 'package:citas_2/screen/s_4_busqueda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../functions/f_0_functions.dart';
import '../common/widgets.dart';
import '../models/horas.dart';

class Agenda extends ConsumerWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datosbase1 = ModalRoute.of(context)!.settings.arguments as Base1;

    final sede = ref.read(riverSede);
    final resumen = ref.watch(riverResumen);
    TextEditingController ctlr_usuario = TextEditingController();
    TextEditingController ctlr_fecha = TextEditingController();
    String hora_selecionada = '';
    TextEditingController ctlr_placa = TextEditingController();
    ctlr_placa.text = datosbase1.PLACA_VEH_TARJETA!;

    TextEditingController ctlr_modelo = TextEditingController();
    ctlr_modelo.text = datosbase1.VERSION_MODELO!;

    TextEditingController ctlr_nveh = TextEditingController();
    ctlr_nveh.text = datosbase1.SERIE!;

    TextEditingController ctlr_nombre = TextEditingController();
    ctlr_nombre.text = datosbase1.CLIENTE!;

    TextEditingController ctlr_doc = TextEditingController();
    ctlr_doc.text = datosbase1.COD_CLIENTE!;

    TextEditingController ctlr_correo = TextEditingController();
    ctlr_correo.text = datosbase1.EMAIL!;

    TextEditingController ctlr_telefono = TextEditingController();
    ctlr_telefono.text = datosbase1.TELEFONO1!;

    String desplegable1 = '';
    String desplegable2 = '';
    String desplegable3 = '';
    TextEditingController ctlr_comentario = TextEditingController();
    var l;
    ctlr_fecha.text = fechaDeHoy();
    String fecharegistro = fechaDeHoy();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (sede.sede == "Surquillo") ? Colors.blue : Colors.green,
        title: Text('Agendar Cita - Sede: ${sede.sede}'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            ref.read(drop3).descartame(); // reiniciar horario
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
                  ref.read(riverFecha.notifier).setFecha(ctlr_fecha.text);
                },
              ),
              // cargar las fechas
              BotonCallback(
                label: '>',
                width: 50,
                height: 50,
                callback: () async {
                  if ((ctlr_fecha.text != '') && (ctlr_fecha.text != 'seleccione fecha')) {
                    List<Horas> data =
                        await FutureHoraDisponible().mishoras([sede.sede, ctlr_fecha.text]);
                    ref.read(drop3).setlist(data);
                  }
                },
              ),
              // hora
              Consumer(
                builder: ((context, ref, _) {
                  final val3 = ref.watch(drop3);
                  hora_selecionada = val3.inivalue1;
                  return Desplegable3(opciones: val3.opciones1, opcioninicial: val3.inivalue1);
                }),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // tipo de problema
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                desplegable1 = val1.inivalue1;
                return Desplegable(opciones: val1.opciones1, opcioninicial: val1.inivalue1);
              })),
              // subtipo de problema
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                desplegable2 = val1.inivalue2;
                return Desplegable(opciones: val1.opciones2, opcioninicial: val1.inivalue2);
              })),
              // tipo de llamada
              Consumer(builder: ((context, ref, _) {
                final val1 = ref.watch(drop1);
                desplegable3 = val1.inivalue3;

                return Desplegable(opciones: val1.opciones3, opcioninicial: val1.inivalue3);
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 320,
              ),
              BotonCallback(
                label: 'Salir',
                width: 150,
                height: 50,
                callback: () {
                  Navigator.pop(context);
                },
              ),
              BotonCallback(
                label: 'Guardar',
                width: 150,
                height: 50,
                callback: () async {
                  if ((ctlr_fecha.text != null ||
                          ctlr_usuario.text != "" ||
                          ctlr_fecha.text != "" ||
                          ctlr_fecha.text != 'seleccione fecha') &&
                      (hora_selecionada != "" || hora_selecionada != "vacio")) {
                    // mensaje de guardado
                    final sanck = SnackBar(
                      content: const Text('Guardando'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sanck);
                    final val2 = ref.read(riverAgendar); // no es necesario
                    l = await guardaragenda(
                      usuario: ctlr_usuario.text,
                      fecha: ctlr_fecha.text,
                      hora: hora_selecionada,
                      placa: ctlr_placa.text,
                      modelo: ctlr_modelo.text,
                      nveh: ctlr_nveh.text,
                      nombre: ctlr_nombre.text,
                      doc: ctlr_doc.text,
                      correo: ctlr_correo.text,
                      telefono: ctlr_telefono.text,
                      desple1: desplegable1,
                      desple2: desplegable2,
                      desple3: desplegable3,
                      sede: sede.sede,
                      comentario: ctlr_comentario.text,
                      fecharegistro: fecharegistro,
                    ) as List;

                    if (l != null && l.length > 0 && l![0]['status'] == "ok") {
                      val2.setUsuario(ctlr_usuario.text); // no es necesario
                      val2.setFecha(ctlr_fecha.text); // no es necesario
                      val2.setHora(hora_selecionada); // no es necesario
                      val2.setPlaca(ctlr_placa.text); // no es necesario
                      val2.setModelo(ctlr_modelo.text); // no es necesario
                      val2.setNveh(ctlr_nveh.text); // no es necesario
                      val2.setNombre(ctlr_nombre.text); // no es necesario
                      val2.setDoc(ctlr_doc.text); // no es necesario
                      val2.setCorreo(ctlr_correo.text); // no es necesario
                      val2.setTelefono(ctlr_telefono.text); // no es necesario
                      val2.setDesplegable1(desplegable1); // no es necesario
                      val2.setDesplegable2(desplegable2); // no es necesario
                      val2.setDesplegable3(desplegable3); // no es necesario
                      val2.setSede(sede.sede); // no es necesario
                      val2.setComentario(ctlr_comentario.text); // no es necesario
                      val2.setFechaRegistro(fecharegistro); // no es necesario
                      ref.read(drop3).descartame(); // reiniciar horario de desplegable
                      Navigator.of(context).pushNamedAndRemoveUntil('/splash', (route) => false);
                    } else {
                      final sanck = SnackBar(
                        content: const Text('Error en registro de agendamiento'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            //
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(sanck);
                    }
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
