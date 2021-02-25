import 'package:flutter/material.dart';
import 'package:formvalidation/src/services/service.dart';
import 'package:formvalidation/src/models/estaciones_models.dart';
import 'package:formvalidation/src/pages/tab1_page_estacion.dart';
import 'package:provider/provider.dart';

class ListaNoticias extends StatelessWidget {
  final List<Datum> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Estaciones de México "),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
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
  final Datum noticia;
  final int index;
  final Datum pressid;

  const _Noticia({@required this.noticia, @required this.index, this.pressid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _CuerpoEstacion(noticia),
        //_TarjetaImagen(noticia),
        // _TarjetaBody(noticia),
        _TarjetaBotones(noticia),
        SizedBox(height: 25),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Datum noticia;

  const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 10),
          FlatButton(
            color: Colors.blue[400],
            onPressed: () {
              newsService.selectedId = noticia.uid;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (arguments) => Tab1PageEstacion()),
              );
            },
            child: Text("Ver estacion",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

// class _TarjetaBody extends StatelessWidget {
//   final Datum noticia;

//   const _TarjetaBody(this.noticia);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Text((noticia.time.vtime.toString() != null)
//             ? noticia.time.vtime.toString()
//             : ''));
//   }
// }

class _TarjetaImagen extends StatelessWidget {
  final Datum noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        // child: Container(
        //   child: ( noticia.urlToImage != null )
        //       ? FadeInImage(
        //           placeholder: AssetImage( 'assets/img/giphy.gif' ),
        //           image: NetworkImage( noticia.urlToImage )
        //         )
        //       : Image( image: AssetImage('assets/img/no-image.png'), )
        // ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Datum noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Text(
            noticia.station.name,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue[600]),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _CuerpoEstacion extends StatelessWidget {
  final Datum noticia;

  const _CuerpoEstacion(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: 'Fecha: ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${noticia.time.stime} ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: ' Geo: ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${noticia.station.geo.toString()} ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
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
  final Datum noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: 'Estación: ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${index + 1} ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: ' ', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: 'Identificador: ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: Colors.blue[900],
                    )),
                TextSpan(
                  text: '${noticia.uid}',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
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
