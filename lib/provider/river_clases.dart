import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// capturar la información del usuario
class User with ChangeNotifier {
  String _u = "";
  get u => _u;
  void identifyUser(data) {
    _u = data;
    notifyListeners();
  }
}

// capturar la información de la fecha de agendamiento
class Fecha with ChangeNotifier {
  String _f = "";
  get f => _f;
  void setFecha(data) {
    _f = data;
    notifyListeners();
  }
}

// capturar la información de la hora de agendamiento
class Hora with ChangeNotifier {
  String _h = "";
  get h => _h;
  void setHora(data) {
    _h = data;
    notifyListeners();
  }
}

// Dinamica capturar la información de los desplegables
class Dd1 with ChangeNotifier {
  final List _opciones1 = [
    'MEC Garantía',
    'MEC Mantenimiento Preventivo',
    'MEC Otros Servicios',
    'MEC Reparaciones Generales'
  ];

  // 1
  final List _opciones2 = ['MEC Garantía', 'MEC Llamado a Revisión'];
  final List _opciones3 = ['MEC Paquete Mant. Preventivo'];
  final List _opciones4 = [
    'MEC Instalación de Accesorios',
    'MEC Lavado',
    'MEC Servicios Adicionales',
    'MEC Tasación'
  ];
  final List _opciones5 = ['MEC Diagnóstico', 'MEC Reparaciones Generales'];

  // 2
  final List _opciones6 = ['vacio'];
  final List _opciones7 = ['vacio'];
  // 3
  final List _opciones8 = [
    'MOT - SERV. -MANT 500',
    'MOT - SERV. -MANT 2000',
    'MOT - SERV. -MANT 4000',
    'MOT - SERV. -MANT 6000',
    'MOT - SERV. -MANT 8000',
    'MOT - SERV. -MANT 10000',
    'MOT - SERV. -MANT 12000',
    'MOT - SERV. -MANT 14000',
    'MOT - SERV. -MANT 16000',
    'MOT - SERV. -MANT 18000',
    'MOT - SERV. -MANT 20000',
    'MOT - SERV. -MANT 22000',
    'MOT - SERV. -MANT 24000',
    'MOT - SERV. -MANT 26000',
    'MOT - SERV. -MANT 28000',
    'MOT - SERV. -MANT 30000',
    'MOT - SERV. -MANT 32000',
    'MOT - SERV. -MANT 34000',
    'MOT - SERV. -MANT 38000',
    'MOT - SERV. -MANT 40000',
    'MOT - SERV. -MANT 50000',
    'MOT - SERV. -MANT 52000',
    'MOT - SERV. -MANT 56000',
    'MOT - SERV. -MANT 60000',
    'MOT - SERV. -MANT 66000',
    'MOT - SERV. -MANT 80000',
    'MOT - SERV. -MANT 82000'
  ];
  // 4
  final List _opciones9 = ['vacio'];
  final List _opciones10 = ['vacio'];
  final List _opciones11 = ['vacio'];
  final List _opciones12 = ['vacio'];
  // 5
  final List _opciones13 = ['vacio'];
  final List _opciones14 = ['vacio'];

  final List _default = ['vacio'];

  List pivotlist = [];
  List pivotlist2 = [];

  late String _inivalue1;
  late String _inivalue2;
  late String _inivalue3;

  Dd1() {
    _inivalue1 = _opciones1[0];
    pivotlist = _default;
    pivotlist2 = _default;
    _inivalue2 = pivotlist[0];
    _inivalue3 = pivotlist2[0];
  }

// getter options
  List get opciones1 => _opciones1;
  List get opciones2 => pivotlist;
  List get opciones3 => pivotlist2;

  String get inivalue1 => _inivalue1;
  String get inivalue2 => _inivalue2;
  String get inivalue3 => _inivalue3;

  // function to updatethe dropdown
  void setOptions(String y) {
    //y en Dd1
    if (_opciones1.contains(y)) {
      _inivalue1 = y;
    }
    //y en Dd1 --> Dd2
    if (_opciones1.contains(y)) {
      if (y == _opciones1[0]) {
        //'MEC Garantía'
        pivotlist = _opciones2;
        _inivalue2 = pivotlist[0];
      } else if (y == _opciones1[1]) {
        //'MEC Mantenimiento Preventivo'
        pivotlist = _opciones3;
        _inivalue2 = pivotlist[0];
      } else if (y == _opciones1[2]) {
        //'MEC Otros Servicios'
        pivotlist = _opciones4;
        _inivalue2 = pivotlist[0];
      } else if (y == _opciones1[3]) {
        //'MEC Reparaciones Generales'
        pivotlist = _opciones5;
        _inivalue2 = pivotlist[0];
      }
    }

    //y Dd2 --> Dd3
    if (_opciones2.contains(y) ||
        _opciones3.contains(y) ||
        _opciones4.contains(y) ||
        _opciones5.contains(y)) {
      _inivalue2 = y;
      if (y == _opciones2[0]) {
        //'MEC Garantía'
        pivotlist2 = _opciones6;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones2[1]) {
        //'MEC Llamado a Revisión'
        pivotlist2 = _opciones7;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones3[0]) {
        //MEC Paquete Mant. Preventivo
        pivotlist2 = _opciones8;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones4[0]) {
        //'MEC Instalación de Accesorios'
        pivotlist2 = _opciones9;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones4[1]) {
        //'MEC Lavado'
        pivotlist2 = _opciones10;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones4[2]) {
        //'MEC Servicios Adicionales'
        pivotlist2 = _opciones11;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones4[3]) {
        //'MEC Tasación'
        pivotlist2 = _opciones12;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones5[0]) {
        //'MEC Diagnóstico'
        pivotlist2 = _opciones13;
        _inivalue3 = pivotlist2[0];
      } else if (y == _opciones5[1]) {
        //'MEC Reparaciones Generales'
        pivotlist2 = _opciones14;
        _inivalue3 = pivotlist2[0];
      }
    }

    if (_opciones6.contains(y) ||
        _opciones7.contains(y) ||
        _opciones8.contains(y) ||
        _opciones9.contains(y) ||
        _opciones10.contains(y) ||
        _opciones11.contains(y) ||
        _opciones12.contains(y)) {
      _inivalue3 = y;
    }
    notifyListeners();
  }
}
