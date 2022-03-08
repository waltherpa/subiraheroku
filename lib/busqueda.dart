import 'package:flutter/material.dart';
import 'Utilities/Buttons.dart';

class Busqueda extends StatefulWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  Widget build(BuildContext context) {
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
            children: const [
              CampodeTexto(
                label: "Placa",
                width: 100,
                height: 50,
              ),
              CampodeTexto(
                label: "Modelo",
                width: 150,
                height: 50,
              ),
              CampodeTexto(
                label: "N Veh",
                width: 100,
                height: 50,
              ),
              CampodeTexto(
                label: "Tipo de Trabajo",
                width: 200,
                height: 50,
              ),
            ],
          ),
          Row(
            children: const [
              CampodeTexto(
                label: "Nombre de Cliente",
                width: 200,
                height: 50,
              ),
              CampodeTexto(
                label: "Doc/Ruc/DNI",
                width: 100,
                height: 50,
              ),
              CampodeTexto(
                label: "Correo",
                width: 150,
                height: 50,
              ),
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
            children: const [
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
