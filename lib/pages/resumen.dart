import 'package:flutter/material.dart';
import 'package:citas1/utilities/buttons.dart';

class Resumen extends StatefulWidget {
  const Resumen({Key? key}) : super(key: key);

  @override
  State<Resumen> createState() => _ResumenState();
}

class _ResumenState extends State<Resumen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Boton(
                label: "Exportar",
                width: 150,
                height: 50,
              ),
              Boton(
                label: "Flitro Cliente",
                width: 150,
                height: 50,
              ),
              Boton(
                label: "Flitro Fecha",
                width: 150,
                height: 50,
              )
            ],
          ),
          Row()
        ],
      ),
    );
  }
}
