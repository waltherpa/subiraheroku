import 'package:flutter/material.dart';
import 'package:citas1/utilities/buttons.dart';

class Busqueda extends StatefulWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  Widget build(BuildContext context) {
    List Ldata = ModalRoute.of(context)!.settings.arguments as List;
    TextEditingController placaCtlr = TextEditingController();
    placaCtlr.text == Ldata[0]['PLACA_VEH_TARJETA'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busqueda'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Column(
        children: [
          Row(
            children: const [
              CampodeTexto(
                label: "Quien Agenda",
                width: 200,
                height: 50,
              ),
              CampodeTexto(
                label: "Fecha",
                width: 150,
                height: 50,
              ),
              CampodeTexto(
                label: "Hora",
                width: 100,
                height: 50,
              ),
              CampodeTexto(
                label: "Estado de Cita",
                width: 150,
                height: 50,
              ),
              CampodeTexto(
                label: "N Cita",
                width: 100,
                height: 50,
              ),
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
              ),
              // numero veh
              CampodeTexto(
                label: "N Veh",
                width: 100,
                height: 50,
              ),
              Desplegable(
                pista: "Tipo de Problema",
                opciones: [
                  "MEC Garantía",
                  "MEC Mantenimiento Preventivo",
                  "MEC Otros Servicios",
                  "MEC Reparaciones Generales"
                ],
              ),
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
            children: const [
              // nombre cliente
              CampodeTexto(
                label: "Nombre de Cliente",
                width: 200,
                height: 50,
              ),
              // documento
              CampodeTexto(
                label: "Doc/Ruc/DNI",
                width: 100,
                height: 50,
              ),
              // correo
              CampodeTexto(
                label: "Correo",
                width: 150,
                height: 50,
              ),
              // telefono
              CampodeTexto(
                label: "Telefono",
                width: 100,
                height: 50,
              ),
            ],
          ),
          Row(
            children: const [
              CampodeTexto(
                label: "Asesor",
                width: 200,
                height: 50,
              ),
            ],
          ),
          //comentarios
          Row(
            children: const [
              CampodeComentario(
                label: "comentario",
                width: 580,
                height: 100,
              )
            ],
          ),
          //botones
          Row(
            children: [
              Boton(
                label: "Salir sin Guardar",
                width: 200,
                height: 50,
              ),
              Boton(
                label: "Editar",
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
