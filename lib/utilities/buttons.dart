import 'package:flutter/material.dart';

class Boton extends StatefulWidget {
  final String label;
  final double width;
  final double height;
  final String ruta;

// botones
  const Boton(
      {Key? key,
      this.label = "label",
      this.width = 10,
      this.height = 10,
      this.ruta = ""})
      : super(key: key);

  @override
  State<Boton> createState() => _BotonState();
}

class _BotonState extends State<Boton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: ElevatedButton(
            onPressed: () {
              if (widget.ruta != "") {
                Navigator.pushNamed(context, widget.ruta);
              }
            },
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// campo de texto
class CampodeTexto extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  const CampodeTexto(
      {Key? key, this.label = "label", this.width = 10, this.height = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
        ),
      ),
    );
  }
}

//campo de comentarios
class CampodeComentario extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  const CampodeComentario(
      {Key? key, this.label = "", this.width = 10, this.height = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: label)),
      ),
    );
  }
}

// desplegable
class Desplegable extends StatefulWidget {
  final List<String> opciones;
  final String pista;
  const Desplegable(
      {Key? key, this.opciones = const ["vacio"], this.pista = "vacio"})
      : super(key: key);

  @override
  State<Desplegable> createState() => _DesplegableState();
}

class _DesplegableState extends State<Desplegable> {
  String? op;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: DropdownButton(
            focusColor: Colors.blue,
            value: op,
            style: const TextStyle(color: Colors.black),
            items: widget.opciones
                .map((e) => DropdownMenuItem(
                      child: Text(e, style: const TextStyle(fontSize: 10)),
                      value: e,
                    ))
                .toList(),
            hint: Text(widget.pista),
            onChanged: (value) {
              setState(() {
                op = value as String;
              });
            }),
      ),
    );
  }
}