import 'package:flutter/material.dart';
import '../common/widgets.dart';

class Busqueda extends StatefulWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar de Cliente'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Boton(
                label: 'editar',
                width: 150,
                height: 50,
                ruta: 'planner',
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Hero(
                    tag: 'logo',
                    child: Image(image: AssetImage('assets/download.jpg'))),
              )
            ],
          )
        ],
      ),
    );
  }
}
