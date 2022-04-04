import 'package:citas1/model/horas.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../model/logcitas.dart';
import '../common/widgets.dart';
import '../function/fbase1.dart';
import '../provider/globalvariables.dart';

class Agenda2 extends ConsumerWidget {
  const Agenda2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datos = ModalRoute.of(context)!.settings.arguments as LogCitas;
    final sede = ref.read(SedeProv);
    final resumen = ref.watch(resf);
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_usuario = TextEditingController();
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_fecha = TextEditingController();
    ctlr_fecha.text == datos.Fecha;
    // ignore: non_constant_identifier_names
    String hora_selecionada = datos.Fecha;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_placa = TextEditingController();
    ctlr_placa.text = datos.Placa;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_modelo = TextEditingController();
    ctlr_modelo.text = datos.Modelo;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_nveh = TextEditingController();
    ctlr_nveh.text = datos.Nveh;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_nombre = TextEditingController();
    ctlr_nombre.text = datos.Nombre;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_doc = TextEditingController();
    ctlr_doc.text = datos.Documento;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_correo = TextEditingController();
    ctlr_correo.text = datos.Correo;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_telefono = TextEditingController();
    ctlr_telefono.text = datos.Telefono;
    String desplegable1 = datos.TipoProblema;
    String desplegable2 = datos.SuptipoProblema;
    String desplegable3 = datos.SuptipoProblema;
    // ignore: non_constant_identifier_names
    TextEditingController ctlr_comentario = TextEditingController();
    ctlr_comentario.text = datos.Comentarios;

    var l;
    var data;
    // ctlr_fecha.text = fechaDeHoy();
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
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 150,
              ),
              MiTexto(
                eltexto: datos.Fecha,
                width: 100,
                height: 20,
              ),
              MiTexto(
                eltexto: datos.Hora,
                width: 100,
                height: 20,
              ),
            ],
          ),
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
              // cargar las fechas
              BotonCallback(
                label: '>',
                width: 50,
                height: 50,
                callback: () async {
                  List<Horas> data =
                      await FutureHoraDisponible().mishoras([sede.sede, ctlr_fecha.text]);
                  ref.read(drop3).setlist(data);
                },
              ),
              // hora
              Consumer(builder: ((context, ref, _) {
                final val3 = ref.watch(drop3);
                hora_selecionada = val3.inivalue1;
                return Desplegable3(opciones: val3.opciones1, opcioninicial: val3.inivalue1);
              })),
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
              const SizedBox(
                width: 150,
              ),
              MiTexto(
                eltexto: datos.TipoProblema,
                width: 100,
                height: 20,
              ),
              MiTexto(
                eltexto: datos.SuptipoProblema,
                width: 100,
                height: 20,
              ),
              MiTexto(
                eltexto: datos.TipoLlamada,
                width: 100,
                height: 20,
              ),
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
              Boton(
                label: 'Salir',
                width: 150,
                height: 50,
                ruta: '/planner',
              ),
              Boton(
                label: 'eliminar',
                width: 150,
                height: 50,
                ruta: '/planner',
                color: Colors.orange.shade700,
                funcion: () {
                  // eliminar
                  print(datos.id_lg.toString());
                },
              ),
              GuardarBoton(
                label: 'Guardar',
                width: 150,
                height: 50,
                ruta: '/planner',
                agenda: () async {
                  // eliminar

                  // guardar
                  final val2 = ref.read(agen);
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
                    val2.setUsuario(ctlr_usuario.text);
                    val2.setFecha(ctlr_fecha.text);
                    val2.setHora(hora_selecionada);
                    val2.setPlaca(ctlr_placa.text);
                    val2.setModelo(ctlr_modelo.text);
                    val2.setNveh(ctlr_nveh.text);
                    val2.setNombre(ctlr_nombre.text);
                    val2.setDoc(ctlr_doc.text);
                    val2.setCorreo(ctlr_correo.text);
                    val2.setTelefono(ctlr_telefono.text);
                    val2.setDesplegable1(desplegable1);
                    val2.setDesplegable2(desplegable2);
                    val2.setDesplegable3(desplegable3);
                    val2.setSede(sede.sede);
                    val2.setComentario(ctlr_comentario.text);
                    val2.setFechaRegistro(fecharegistro);
                    ref.read(drop3).descartame(); // reiniciar horario de desplegable
                    Navigator.of(context).pop('/agenda2');
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
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
