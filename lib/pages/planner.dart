import 'package:flutter/material.dart';
import '../common/widgets.dart';

class Planner extends StatelessWidget {
  Planner({Key? key}) : super(key: key);
  TextEditingController placaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner 2'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // botones control
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // boton agendar
                  const Boton(
                    label: "Agendar",
                    width: 150,
                    height: 50,
                    ruta: "/agenda",
                  ),
                  // field placa
                  CampoDeTexto(
                    label: 'Placa',
                    width: 100,
                    height: 50,
                    controlador: placaCtrl,
                  ),
                  // boton buscar
                  Boton(
                    label: "buscar Placa",
                    width: 150,
                    height: 50,
                    ruta: "/busqueda",
                    controlador: placaCtrl,
                  ),
                  // boton resumen
                  const Boton(
                    label: "Resumen",
                    width: 150,
                    height: 50,
                    ruta: "/resumen",
                  ),
                  // boton seguiente semana
                  const Boton(
                    label: "Resumen",
                    width: 150,
                    height: 50,
                    ruta: "/resumen",
                  ),
                ],
              ),
            ),

            // table time planner
            const Expanded(
              flex: 1,
              child: Center(
                child: TatblaPlanner(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
