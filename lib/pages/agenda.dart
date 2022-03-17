import 'package:flutter/material.dart';
import 'package:citas1/utilities/buttons.dart';
import 'package:citas1/function/fbase1.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  TextEditingController timeinputCtlr = TextEditingController();
  TextEditingController dateinputCtlr = TextEditingController();
  TextEditingController placaCtlr = TextEditingController();
  TextEditingController modeloCtlr = TextEditingController();
  TextEditingController nvehCtlr = TextEditingController();
  TextEditingController dropbox1Ctlr = TextEditingController();
  TextEditingController dropbox2Ctlr = TextEditingController();
  TextEditingController dropbox3Ctlr = TextEditingController();
  TextEditingController nombreCtlr = TextEditingController();
  TextEditingController ndocCtlr = TextEditingController();
  TextEditingController correoCtlr = TextEditingController();
  TextEditingController telefonoCtlr = TextEditingController();
  TextEditingController asesorCtlr = TextEditingController();
  TextEditingController comentarioCtlr = TextEditingController();

  // clearing values
  @override
  void initState() {
    timeinputCtlr.text = ""; //set the initial value of text field
    super.initState();

    dateinputCtlr.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController user =
        ModalRoute.of(context)?.settings.arguments as TextEditingController;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Column(
        children: [
          // campos
          Row(
            children: [
              // quien agenda
              CampodeTexto(
                label: "Quien Agenda",
                width: 200,
                height: 50,
                controller: user,
              ),
              // fecha
              CampoFechaHora(
                label: "Fecha",
                width: 150,
                height: 50,
                myfunction: () => onDateChanged(context, dateinputCtlr),
                controller: dateinputCtlr,
              ),
              // hora
              CampoFechaHora(
                label: "Hora",
                width: 150,
                height: 50,
                myfunction: () => onTimeChanged(context, timeinputCtlr),
                controller: timeinputCtlr,
              ),
              // numero de cita
            ],
          ),
          Row(
            children: [
              // placa
              CampodeTexto(
                label: "Placa",
                width: 100,
                height: 50,
                controller: placaCtlr,
              ),
              // modelo
              CampodeTexto(
                label: "Modelo",
                width: 150,
                height: 50,
                controller: modeloCtlr,
              ),
              // numero de vehiculo
              CampodeTexto(
                label: "N Veh",
                width: 100,
                height: 50,
                controller: nvehCtlr,
              ),
              // tipo de problema
              Desplegable(
                pista: "Tipo de Problema",
                opciones: [
                  "MEC Garantía",
                  "MEC Mantenimiento Preventivo",
                  "MEC Otros Servicios",
                  "MEC Reparaciones Generales"
                ],
              ),
              // subtipo de problema
              Desplegable(
                pista: "Subtipo de problema",
                opciones: [
                  "MEC Garantía",
                  "MEC Llamado a Revisión",
                  "MEC Paquete Mant. Preventivo",
                  "MEC Instalación de Accesorios",
                  "MEC Lavado",
                  "MEC Servicios Adicionales",
                  "MEC Tasación",
                  "MEC Diagnóstico",
                  "MEC Reparaciones Generales",
                ],
              ),
              // tipo de llamada
              Desplegable(
                pista: "Tipo de llamada",
                opciones: [
                  "MOT - SERV. -MANT 500",
                  "MOT - SERV. -MANT 2000",
                  "MOT - SERV. -MANT 4000",
                  "MOT - SERV. -MANT 6000",
                  "MOT - SERV. -MANT 8000",
                  "MOT - SERV. -MANT 10000",
                  "MOT - SERV. -MANT 12000",
                  "MOT - SERV. -MANT 14000",
                  "MOT - SERV. -MANT 16000",
                  "MOT - SERV. -MANT 18000",
                  "MOT - SERV. -MANT 20000",
                  "MOT - SERV. -MANT 22000",
                  "MOT - SERV. -MANT 24000",
                  "MOT - SERV. -MANT 26000",
                  "MOT - SERV. -MANT 28000",
                  "MOT - SERV. -MANT 30000",
                  "MOT - SERV. -MANT 32000",
                  "MOT - SERV. -MANT 34000",
                  "MOT - SERV. -MANT 38000",
                  "MOT - SERV. -MANT 40000",
                  "MOT - SERV. -MANT 50000",
                  "MOT - SERV. -MANT 52000",
                  "MOT - SERV. -MANT 56000",
                  "MOT - SERV. -MANT 60000",
                  "MOT - SERV. -MANT 66000",
                  "MOT - SERV. -MANT 80000",
                  "MOT - SERV. -MANT 82000"
                ],
              ),
            ],
          ),
          Row(
            children: [
              // nombre de cliente
              CampodeTexto(
                label: "Nombre de Cliente",
                width: 200,
                height: 50,
                controller: nombreCtlr,
              ),
              // documento
              CampodeTexto(
                label: "Doc/Ruc/DNI",
                width: 100,
                height: 50,
                controller: ndocCtlr,
              ),
              // correo
              CampodeTexto(
                label: "Correo",
                width: 150,
                height: 50,
                controller: correoCtlr,
              ),
              // telefono
              CampodeTexto(
                label: "Telefono",
                width: 100,
                height: 50,
                controller: telefonoCtlr,
              ),
            ],
          ),
          Row(
            children: [
              // asesor
              Desplegable(
                pista: "Asesor",
                opciones: ["asesor1", "asesor2"],
              ),
            ],
          ),
          //comentarios
          Row(
            children: [
              // comentarios
              CampodeComentario(
                label: "comentario",
                width: 580,
                height: 100,
                controller: comentarioCtlr,
              )
            ],
          ),
          //botones
          Row(
            children: const [
              // salir sin guardar
              Boton(
                label: "Salir sin Guardar",
                width: 200,
                height: 50,
              ),
              // guardar
              Boton(
                label: "Guardar",
                width: 200,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
