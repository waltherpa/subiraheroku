import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController placaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLANNER'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // botones de control
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // buscar
                SizedBox(
                  width: 230,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.car_repair,
                          size: 30,
                        ),
                        const Flexible(
                          child: SizedBox(
                            width: 100,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'placa'),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/inputdata');
                          },
                          child: const Text(
                            'Buscar',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // agendar
                SizedBox(
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 30,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030));
                            },
                            child: const Text(
                              'Agendar',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.table_chart,
                          size: 30,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/managerMatrix');
                            },
                            child: const Text(
                              'Resumen citas',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            // matriz de calendario
            DataTable(
              dataRowHeight: 30.0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Hora'),
                ),
                DataColumn(
                  label: Text('Fecha 1'),
                ),
                DataColumn(
                  label: Text('Fecha 2'),
                ),
                DataColumn(
                  label: Text('Fecha 3'),
                ),
                DataColumn(
                  label: Text('Fecha 4'),
                ),
                DataColumn(
                  label: Text('Fecha 5'),
                ),
                DataColumn(
                  label: Text('Fecha 6'),
                ),
                DataColumn(
                  label: Text('Fecha 7'),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: [
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('7:00 - 7:10'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 1'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 2'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 3'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 4'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 5'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 6'),
                        ),
                      ),
                    ),
                    DataCell(
                      Card(
                        child: SizedBox(
                          height: 20,
                          child: Text('col 7'),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('7:10-7:20')),
                    DataCell(Text('col 1')),
                    DataCell(Text('col 2')),
                    DataCell(Text('col 3')),
                    DataCell(Text('col 4')),
                    DataCell(Text('col 5')),
                    DataCell(Text('col 6')),
                    DataCell(Text('col 7')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('7:20-7:30')),
                    DataCell(Text('col 1')),
                    DataCell(Text('col 2')),
                    DataCell(Text('col 3')),
                    DataCell(Text('col 4')),
                    DataCell(Text('col 5')),
                    DataCell(Text('col 6')),
                    DataCell(Text('col 7')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
