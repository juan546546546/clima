import 'package:flutter/material.dart';

class InformacionPage extends StatefulWidget {
  @override
  _IAlertDialogState createState() => _IAlertDialogState();
}

class _IAlertDialogState extends State<InformacionPage> {
  final estiloTitulo = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 20.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Información"),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.backspace),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //_crearImagen(context),
              _crearTitulo(),
              _implicacionesSalud(),
              _crearAcciones1(),
              _crearAcciones2(),
              _crearAcciones3(),
              _cautionaryStatement(),
              _crearTexto(),
              _crearTexto2(),
              _crearTexto3(),
              _crearTexto4(),
              _crearTexto6(),
              _crearTexto5(),
            ],
          ),
        ));
  }

  ///
  ///
  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'scroll'),
        child: Image(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2019/08/30/21/16/lake-4442337_960_720.jpg'),
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Escala de índice de calidad del aire y leyenda de colores ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]),
                      textAlign: TextAlign.center),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
            Icon(Icons.cloud_circle, color: Colors.red, size: 35.0),
            Text('AQI', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _implicacionesSalud() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Implicaciones para la salud ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700]),
                      textAlign: TextAlign.center),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cautionaryStatement() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Declaración de precaución (para PM2.5)',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue[700]),
                      textAlign: TextAlign.center),
                  SizedBox(height: 0.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.cloud_done, 'Buena'),
        _accion2(Icons.accessibility_new, 'Moderado'),
      ],
    );
  }

  Widget _crearAcciones2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion3(Icons.group_work_rounded, 'Nocivo en grupos'),
        _accion4(Icons.close_rounded, 'Nocivo'),
      ],
    );
  }

  Widget _crearAcciones3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion5(Icons.cloud_off, 'Muy nocivo'),
        _accion6(Icons.dangerous, 'Peligroso'),
      ],
    );
  }

  ///tabla de los colores accion 1
  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.green),
        ),
        Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green,
                  title: Text("Buena",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "La calidad del aire se considera satisfactoria y la contaminación del aire presenta poco o ningún riesgo.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI)  0 - 50",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 2
  Widget _accion2(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.yellowAccent[700]),
        ),
        Center(
          child: FlatButton(
            color: Colors.yellow[600],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.yellowAccent[700],
                  title: Text("Moderado",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "La calidad del aire es aceptable; sin embargo, para algunos contaminantes puede haber un problema de salud moderado para un número muy pequeño de personas que son inusualmente sensibles a la contaminación del aire.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI)  51 - 100",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 3
  Widget _accion3(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.orange[800]),
        ),
        Center(
          child: FlatButton(
            color: Colors.orange[600],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.orange[600],
                  title: Text("Nocivo para grupos sensibles",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Los miembros de grupos sensibles pueden experimentar efectos sobre la salud. No es probable que el público en general se vea afectado.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI) 101 - 150",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 4
  Widget _accion4(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[800]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[600],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[600],
                  title: Text("Nocivo",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Todos pueden comenzar a experimentar efectos sobre la salud; los miembros de grupos sensibles pueden experimentar efectos de salud más graves",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI) 151 - 200",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 5
  Widget _accion5(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[800]),
        ),
        Center(
          child: FlatButton(
            color: Colors.purple[600],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.purple[600],
                  title: Text("Muy nocivo",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Advertencias sanitarias de situaciones de emergencia. Es más probable que toda la población se vea afectada.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI) 201 - 300",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  ///tabla de los colores accion 4
  Widget _accion6(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.black, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.red[900]),
        ),
        Center(
          child: FlatButton(
            color: Colors.red[900],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[900],
                  title: Text("Peligroso",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // FlatButton(
                    //   child: Text("No"),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                  content: Text(
                      "Alerta de salud: todos pueden experimentar efectos de salud más graves.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              );
            },
            child: Text("(AQI) 300 +",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Bueno',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  SizedBox(height: 7.0),
                  Text('El aire es conciderado bueno',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
            Icon(Icons.cloud_done, color: Colors.green, size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto2() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Moderado',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent[700])),
                  SizedBox(height: 7.0),
                  Text(
                      'Los niños y adultos activos, y las personas con enfermedades respiratorias, como el asma, deben limitar el esfuerzo prolongado al aire libre.',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Icon(Icons.accessibility_new,
                color: Colors.yellowAccent[700], size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto3() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nocivo para grupos sensibles',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[800])),
                  SizedBox(height: 7.0),
                  Text(
                      'Los niños y adultos activos, y las personas con enfermedades respiratorias, como asma, deben evitar el esfuerzo prolongado al aire libre; todos los demás, especialmente los niños, deben limitar el esfuerzo prolongado al aire libre',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Icon(Icons.group_work_rounded,
                color: Colors.orange[800], size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto4() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nocivo',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800])),
                  SizedBox(height: 7.0),
                  Text(
                      'Los niños y adultos activos, y las personas con enfermedades respiratorias, como asma, deben evitar el esfuerzo prolongado al aire libre; todos los demás, especialmente los niños, deben limitar el esfuerzo prolongado al aire libre',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Icon(Icons.close_rounded, color: Colors.red[800], size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto5() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Peligroso',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900])),
                  SizedBox(height: 7.0),
                  Text('Todos deben evitar todo esfuerzo al aire libre',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Icon(Icons.dangerous, color: Colors.red[900], size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _crearTexto6() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Muy nocivo',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800])),
                  SizedBox(height: 7.0),
                  Text(
                      'Los niños y adultos activos, y las personas con enfermedades respiratorias, como asma, deben evitar todo esfuerzo al aire libre; todos los demás, especialmente los niños, deben limitar el esfuerzo al aire libre.',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Icon(Icons.cloud_off, color: Colors.purple[800], size: 40.0),
          ],
        ),
      ),
    );
  }
}
