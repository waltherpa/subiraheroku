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

// Class de datos para agendamiento
class Agendamiento with ChangeNotifier {
  late String _ctlr_usuario;
  late String _ctlr_fecha;
  late String _ctlr_hora;
  late String _ctlr_placa;
  late String _ctlr_modelo;
  late String _ctlr_nveh;
  late String _ctlr_nombre;
  late String _ctlr_doc;
  late String _ctlr_correo;
  late String _ctlr_telefono;
  late String _deplegalbe1;
  late String _deplegalbe2;
  late String _deplegalbe3;
  late String _sede;
  late String _estadocita;
  late String _ctlr_comentario;

  Agendamiento() {
    _ctlr_usuario = '';
    _ctlr_fecha = '';
    _ctlr_hora = '';
    _ctlr_placa = '';
    _ctlr_modelo = '';
    _ctlr_nveh = '';
    _ctlr_nombre = '';
    _ctlr_doc = '';
    _ctlr_correo = '';
    _ctlr_telefono = '';
    _ctlr_comentario = '';
    _deplegalbe1 = '';
    _deplegalbe2 = '';
    _deplegalbe3 = '';
    _sede = '';
    _estadocita = '';
    _ctlr_comentario = '';
  }

  get ctlr_usuario => _ctlr_usuario;
  get ctlr_fecha => _ctlr_fecha;
  get ctlr_hora => _ctlr_hora;
  get ctlr_placa => _ctlr_placa;
  get ctlr_modelo => _ctlr_modelo;
  get ctlr_nveh => _ctlr_nveh;
  get ctlr_nombre => _ctlr_nombre;
  get ctlr_doc => _ctlr_doc;
  get ctlr_correo => _ctlr_correo;
  get ctlr_telefono => _ctlr_telefono;
  get deplegalbe1 => _deplegalbe1;
  get deplegalbe2 => _deplegalbe2;
  get deplegalbe3 => _deplegalbe3;
  get sede => _sede;
  get estadocita => _estadocita;
  get ctlr_comentario => _ctlr_comentario;

  void setUsuario(String usuario) {
    _ctlr_usuario = usuario;
    notifyListeners();
  }

  void setFecha(String fecha) {
    _ctlr_fecha = fecha;
    notifyListeners();
  }

  void setHora(String hora) {
    _ctlr_hora = hora;
    notifyListeners();
  }

  void setPlaca(String placa) {
    _ctlr_placa = placa;
    notifyListeners();
  }

  void setModelo(String modelo) {
    _ctlr_modelo = modelo;
    notifyListeners();
  }

  void setNveh(String nveh) {
    _ctlr_nveh = nveh;
    notifyListeners();
  }

  void setNombre(String nombre) {
    _ctlr_nombre = nombre;
    notifyListeners();
  }

  void setDoc(String doc) {
    _ctlr_doc = doc;
    notifyListeners();
  }

  void setCorreo(String correo) {
    _ctlr_correo = correo;
    notifyListeners();
  }

  void setTelefono(String telefono) {
    _ctlr_telefono = telefono;
    notifyListeners();
  }

  void setDesplegable1(String deplegalbe1) {
    _deplegalbe1 = deplegalbe1;
    notifyListeners();
  }

  void setDesplegable2(String deplegalbe2) {
    _deplegalbe2 = deplegalbe2;
    notifyListeners();
  }

  void setDesplegable3(String deplegalbe3) {
    _deplegalbe3 = deplegalbe3;
    notifyListeners();
  }

  void setSede(String sede) {
    _sede = sede;
    notifyListeners();
  }

  void setEstadoCita(String estadocita) {
    _estadocita = estadocita;
    notifyListeners();
  }

  void setComentario(String comentario) {
    _ctlr_comentario = comentario;
    notifyListeners();
  }
}

// segundo nivel de desplegables
class Dd2 with ChangeNotifier {
  final _op1 = ['cita activa', 'cita vencida'];
  final _op2 = ['Suquillo', 'San Miguel'];
  late String _initvalue1;
  late String _initvalue2;
  Dd2() {
    _initvalue1 = _op1[0];
    _initvalue2 = _op2[0];
  }

  List get opciones1 => _op1;
  List get opciones2 => _op2;
  String get inivalue1 => _initvalue1;
  String get inivalue2 => _initvalue2;

  void setop(String w) {
    if (_op1.contains(w)) {
      _initvalue1 = w;
      notifyListeners();
    }
    if (_op2.contains(w)) {
      _initvalue2 = w;
      notifyListeners();
    }
  }
}
