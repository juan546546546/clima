import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/informacion_page.dart';
import 'package:formvalidation/src/pages/tab1_page.dart';
import 'package:formvalidation/src/pages/tab2_page.dart';
import 'package:formvalidation/src/pages/visualizar_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.purple[900],
            ),
            title: Text('Información',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.purple[900])),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_tree_rounded,
                color: Colors.purple[900],
              ),
              title: Text('Estados',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple[900]))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit_outlined,
                color: Colors.purple[900],
              ),
              title: Text('home',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple[900]))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit_outlined,
                color: Colors.purple[900],
              ),
              title: Text('visualizar',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple[900])))
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[InformacionPage(), Tab1Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
