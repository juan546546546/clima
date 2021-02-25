import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productosProvider = new ProductosProvider();
  final usuarioProvider = new LoginBloc();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final estiloTexto = TextStyle(color: Colors.black87);
    return Scaffold(
      appBar: AppBar(
        title: Text("Estación"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () =>
                Navigator.pushNamed(context, 'login').then((context) {
              setState(() {});
            }),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          //  _pagina1(),
          //  _pagina2(context)
          _crearListado(),
          // _children[_currentIndex]
        ],
      ),

      //IconButton(
      //  icon: Icon(Icons.camera_alt),
      // onPressed: _tomarFoto,
      // ),
    );

    _crearBoton(context);
    // bottomNavigationBar: _bottomNavigationBar(context),
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
          Text('Menu', style: estiloTexto),
          //Text('MYAPPETITE', style: estiloTexto),
          // Container(
          // child: Text('${bloc.nombre}', style: estiloTexto2),
          // ),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Container(

        //  key: UniqueKey(),
        // background: Container(
        // color: Colors.red,
        //  ),
        // onDismissed: (direccion) {
        //   productosProvider.borrarProducto(producto.id);
        //},
        child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          (producto.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  image: NetworkImage(producto.fotoUrl),
                  fadeInDuration: Duration(milliseconds: 200),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 200.0,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
          ListTile(
            leading: Icon(Icons.restaurant_menu, color: Colors.blue),
            title:
                Text('${producto.titulo}   -   ${producto.valor} ' + ' Pesos'),

            //subtitle: Text('Producto: ' + producto.id),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Ver comida'),
                onPressed: () => Navigator.pushNamed(context, 'producto',
                        arguments: producto)
                    .then((producto) {
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
      onPressed: () =>
          Navigator.pushNamed(context, 'producto').then((producto) {
        setState(() {});
      }),
    );
  }

  _crearCarrito(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add_shopping_cart),
      backgroundColor: Colors.deepPurple,
      onPressed: () =>
          Navigator.pushNamed(context, 'producto').then((producto) {
        setState(() {});
      }),
    );
  }
}
