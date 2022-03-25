import 'package:flutter/material.dart';
import '../common/widgets.dart';

class Resumen extends StatelessWidget {
  const Resumen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busqueda de Cliente'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Boton(
                label: 'Descargar',
                width: 100,
                height: 50,
                ruta: '/planner',
              ),
              Boton(
                label: 'Salir',
                width: 100,
                height: 50,
                ruta: '/planner',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  sortColumnIndex: 2,
                  sortAscending: true,
                  columns: const [
                    DataColumn(label: Text('-')),
                    DataColumn(label: Text('Ncita')),
                    DataColumn(label: Text('Cliente')),
                    DataColumn(
                      label: Text('Placa'),
                      numeric: true,
                    ),
                    DataColumn(label: Text('Fecha'), numeric: true),
                    DataColumn(label: Text('Hora'), numeric: true),
                    DataColumn(label: Text('Tipo mantenimiento'), numeric: true)
                  ],
                  rows: [
                    DataRow(selected: true, cells: [
                      const DataCell(Hero(
                          tag: 'logo',
                          child:
                              Image(image: AssetImage('assets/download.jpg')))),
                      DataCell(const Text('2'),
                          placeholder: true, showEditIcon: true, onTap: () {
                        Navigator.pushNamed(context, '/busqueda');
                      }),
                      const DataCell(
                        Text('Cliente1'),
                      ),
                      const DataCell(Text('111111')),
                      const DataCell(Text('18/03/2022')),
                      const DataCell(Text('7:10')),
                      const DataCell(Text('Mant. 500'))
                    ]),
                    DataRow(cells: [
                      const DataCell(
                          Image(image: AssetImage('assets/download.jpg'))),
                      DataCell(const Text('3'),
                          placeholder: true, showEditIcon: true, onTap: () {
                        Navigator.pushNamed(context, '/busqueda');
                      }),
                      const DataCell(Text('Cliente2')),
                      const DataCell(Text('666666')),
                      const DataCell(Text('18/03/2022')),
                      const DataCell(Text('7:20')),
                      const DataCell(Text('Mant. 500'))
                    ]),
                    DataRow(
                      cells: [
                        const DataCell(
                            Image(image: AssetImage('assets/download.jpg'))),
                        DataCell(const Text('4'),
                            placeholder: true, showEditIcon: true, onTap: () {
                          Navigator.pushNamed(context, '/busqueda');
                        }),
                        const DataCell(Text('Cliente3')),
                        const DataCell(Text('333333')),
                        const DataCell(Text('18/03/2022')),
                        const DataCell(Text('7:30')),
                        const DataCell(Text('Mant. 500'))
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                            Image(image: AssetImage('assets/download.jpg'))),
                        DataCell(const Text('5'),
                            placeholder: true, showEditIcon: true, onTap: () {
                          Navigator.pushNamed(context, '/busqueda');
                        }),
                        const DataCell(Text('Cliente4')),
                        const DataCell(Text('ASW333')),
                        const DataCell(Text('18/03/2022')),
                        const DataCell(Text('7:30')),
                        const DataCell(Text('Mant. 500'))
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                            Image(image: AssetImage('assets/download.jpg'))),
                        DataCell(const Text('6'),
                            placeholder: true, showEditIcon: true, onTap: () {
                          Navigator.pushNamed(context, '/busqueda');
                        }),
                        const DataCell(Text('Cliente5')),
                        const DataCell(Text('5469FB')),
                        const DataCell(Text('18/03/2022')),
                        const DataCell(Text('7:30')),
                        const DataCell(Text('Mant. 500'))
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(
                            Image(image: AssetImage('assets/download.jpg'))),
                        DataCell(const Text('7'),
                            placeholder: true, showEditIcon: true, onTap: () {
                          Navigator.pushNamed(context, '/busqueda');
                        }),
                        const DataCell(Text('Cliente6')),
                        const DataCell(Text('2019BG')),
                        const DataCell(Text('18/03/2022')),
                        const DataCell(Text('7:30')),
                        const DataCell(Text('Mant. 500'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
