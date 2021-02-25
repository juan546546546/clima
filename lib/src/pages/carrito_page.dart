import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/carrito_model';
import 'package:formvalidation/src/providers/carrito_provider.dart';

class CarritoPage extends StatefulWidget {
  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  final carritoProvider = new CarritoProvider();
  final usuarioProvider = new LoginBloc();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final estiloTexto = TextStyle(color: Colors.black87);
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // _pagina1(),
          _crearListado(bloc, context),
          // _children[_currentIndex]
        ],
      ),

      //IconButton(
      //  icon: Icon(Icons.camera_alt),
      // onPressed: _tomarFoto,
      // ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

    final bloc = Provider.of(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('Mi carrito', style: estiloTexto),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _crearListado(LoginBloc bloc, ProductosBloc) {
    return FutureBuilder(
      future: carritoProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CarritoModel>> snapshot) {
        if (snapshot.hasData) {
          final carrito = snapshot.data;

          return ListView.builder(
            itemCount: carrito.length,
            itemBuilder: (context, i) => _crearItem(context, carrito[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, CarritoModel carrito) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion) {
          carritoProvider.borrarProducto(carrito.id);
        },
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
              (carrito.fotoUrl == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(carrito.fotoUrl),
                      fadeInDuration: Duration(milliseconds: 200),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 200.0,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                leading: Icon(Icons.restaurant_menu, color: Colors.blue),
                title: Text(
                    '${carrito.titulo}   -   ${carrito.valor} ' + ' Pesos'),

                //subtitle: Text('Producto: ' + producto.id),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Ver comida'),
                    onPressed: () => Navigator.pushNamed(context, 'producto',
                            arguments: carrito)
                        .then((carrito) {
                      setState(() {});
                    }),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
              // Container(
              //   padding: EdgeInsets.all(9.0),
              //    child: Text('Categoria: ${producto.categoria}')),
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto').then((carrito) {
        setState(() {});
      }),
    );
  }

  _crearCarrito(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add_shopping_cart),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto').then((carrito) {
        setState(() {});
      }),
    );
  }
}
