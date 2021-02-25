import 'dart:math';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/clima_models.dart';
import 'package:formvalidation/src/models/estaciones_models.dart';

class Estacion extends StatelessWidget {
  final List<Data> noticias;

  const Estacion(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estación"),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.backspace),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
        body: ListView.builder(
            itemCount: this.noticias.length,
            itemBuilder: (BuildContext context, int index) {
              return _Noticia(noticia: this.noticias[index], index: index);
            }));
  }
}

class _Noticia extends StatelessWidget {
  final Data noticia;
  final int index;
  final Datum pressid;

  const _Noticia({@required this.noticia, @required this.index, this.pressid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Tarjeta(noticia),
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _CuerpoEstacion(noticia),

        // _TarjetaBody(noticia),
        _TarjetaBotones(noticia),
        SizedBox(height: 80),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Data noticia;

  const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Text(
                  'Geo: ' + noticia.city.geo.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Sensor',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Medida',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Componente',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Co',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.co.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('M.. de carbono')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('H',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.h.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('Humedad')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('NO2',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.no2.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('D. de nitrógeno')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('O3',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text('' + noticia.iaqi.o3.v.toString() + ' m3',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('Ozono')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('PA',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.p.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('Presión')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('PM10',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text('' + noticia.iaqi.pm10.v.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('PM2.5',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(
                        Text('' + noticia.iaqi.pm25.v.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      DataCell(Text('(AQI)')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('SO2',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.so2.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('D. de azufre')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('T',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.t.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('Temperatura')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Viento',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.w.v.toString() + ' m/s',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Wg',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                      DataCell(Text(noticia.iaqi.wg.v.toString() + '',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                      DataCell(Text('Flujo de aire')),
                    ],
                  ),
                ],
              ),

              ////////////
            ],
          )
        ],
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {
  final Data noticia;

  const _Tarjeta(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }

  // calcular aqi

}

class _TarjetaTitulo extends StatelessWidget {
  final Data noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Text(
            noticia.city.name,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue[600]),
            textAlign: TextAlign.center,
          ),
        ),
        Text.rich(
          TextSpan(
            text: ' ', // default text style
            children: <TextSpan>[
              TextSpan(
                  text: ' ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    color: Colors.blue[900],
                  )),
              TextSpan(
                text: '${noticia.iaqi.t.v} °C ',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 50,
                    color: Colors.purple[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CuerpoEstacion extends StatelessWidget {
  final Data noticia;

  const _CuerpoEstacion(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Column(
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: ' Fecha: ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${noticia.debug.sync.toString()} ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Data noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      margin: EdgeInsets.only(bottom: 3),
      child: Row(
        children: <Widget>[
          // Text(
          //   'Estacion seleccionada  ',
          //   style: TextStyle(fontSize: 30, color: Colors.red[100]),
          // ),

          // Text('${noticia.time.iso}. '),
        ],
      ),
    );
  }
}
