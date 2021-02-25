import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart' as provider;
import 'package:formvalidation/src/pages/carrito_page.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/navegacion_page.dart';
import 'package:formvalidation/src/pages/producto_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';
import 'package:formvalidation/src/pages/tabs_page.dart';
import 'package:formvalidation/src/pages/visualizar_page.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:formvalidation/src/services/service.dart';
import 'package:formvalidation/theme/tema.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new NewsService()),
        ],
        child: provider.Provider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Clima',
            initialRoute: 'menu', //cambiar a login
            routes: {
              'login': (BuildContext context) => LoginPage(),
              'registro': (BuildContext context) => RegistroPage(),
              'home': (BuildContext context) => HomePage(),
              'producto': (BuildContext context) => ProductoPage(),
              'visualizar': (BuildContext context) => VisualizarPage(),
              'navegacion': (BuildContext context) => BotonesPage(),
              'carrito': (BuildContext context) => CarritoPage(),
              'menu': (BuildContext context) => TabsPage(),
              //'barra': (BuildContext context) => BarraPage(),
            },
          ),
        ));
  }
}
