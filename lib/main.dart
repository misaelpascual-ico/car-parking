import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State{
  double precio = 0, iva = 0, precioTotal = 0, horas = 0;
  bool tienesMembresia = false, wash = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Estacionamiento'),
          backgroundColor: Color.fromRGBO(35, 178, 100, 20),
        ),
        body:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget> [
                TextField(
                onChanged: (event) {
                  print('=>' + event);
                  setState(() {
                    precio = double.parse(event);
                    iva = precio * 0.16;
                    precioTotal = precio * 1.16;
                  });
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.face),
                  labelText: 'Nombre',
                  hintText: 'Escribe tu nombre',
                  helperText: 'No escribas en mayusculas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              Text('Tienes membresia? $tienesMembresia'),
              Checkbox(
                value: tienesMembresia,
                onChanged: (event) {
                  print(event);
                  setState(() {
                    tienesMembresia = event;
                  });
                },
              ),
              Text('¿ Quires servicio de lavado ? $wash'),
              Switch(
                value: wash,
                onChanged: (event) {
                  setState(() {
                    wash = event;
                  });
                }
              ),
              Row(
                children: <Widget>[
                  Text('Horas')
                ],
              ),
              Slider(
                value: horas,
                min: 0,
                max: 10,
                divisions: 10,
                label: 'Horas totales $horas',
                onChanged: (event) {
                  setState(() {
                    horas = event;
                  });
                },
              ),
              Text('Precio: 78'),
              Text('IVA: 10'),
              Text('Precio total: 88'),
            ]
          )
        )
      )
    );
  }
}