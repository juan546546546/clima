import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formvalidation/src/models/category_model.dart';
import 'package:formvalidation/src/models/clima_models.dart';
import 'package:formvalidation/src/models/estaciones_models.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

import 'package:formvalidation/src/widgets/estacion.dart';
export 'package:formvalidation/src/bloc/productos_bloc.dart';


final _URL_NEWS = 'https://api.waqi.info';
final _APIKEY = '84f345500b6e45baa97fc82af26df243bc24e458';

class NewsService with ChangeNotifier {
  List<Datum> headlines = [];
  List<Data> estacion = [];

 List<Data> datos;

  String _selectedCategory = 'mexico';
  int _selectedId = 0;



  int eleccion;
  bool _isLoading = true;

     

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'cuba'),
    Category(FontAwesomeIcons.tv, 'mexico'),
    Category(FontAwesomeIcons.addressCard, 'california'),
    Category(FontAwesomeIcons.headSideVirus, 'washinton'),
    Category(FontAwesomeIcons.vials, 'jalisco'),
    Category(FontAwesomeIcons.volleyballBall, 'puebla'),
    Category(FontAwesomeIcons.memory, 'puerto rico'),
  ];

  Map<String, List<Datum>> categoryArticles = {};
  Map<dynamic, List<Data>> listaid = {};

  NewsService({Key key, Widget child}) {
    this.getTopHeadlines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = new List();
    });
    this.getArticlesByCategory(this._selectedCategory);
    print('celectCategory :' + _selectedCategory.toString());
  }

  bool get isLoading => this._isLoading;

//////////////DATA
  get selectedId => this._selectedId; ////Datum y luego valor
  set selectedId(valor) {
    this._selectedId = valor;
    this._isLoading = true;
    this.getEstacionesPorId(valor);
    notifyListeners();
  }

/////////////////DATUM
  get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this._isLoading = true;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  ///

  getTopHeadlines() async {
    ///DATUM
    final url = '$_URL_NEWS/search/?token=$_APIKEY&keyword=mexico';
    final resp = await http.get(url);

    final newsResponse = respuestaFromJson(resp.body);
    this.headlines.addAll(newsResponse.data);
  }

  List<Datum> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];
  List<Data> get getEstacionId => this.listaid[this._selectedId];

  /////////////////DATUM
  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }
    final url = '$_URL_NEWS/search/?token=$_APIKEY&keyword=$category';
    final resp = await http.get(url);
    final newsResponse = respuestaFromJson(resp.body);
    this.categoryArticles[category].addAll(newsResponse.data);
    this._isLoading = false;
    this.headlines.addAll(newsResponse.data);
    notifyListeners();
  }

  //////////////////////DATA
  
  getEstacionesPorId(int id) async {

    estacion = [];
    final url = '$_URL_NEWS/feed/@$id/?token=$_APIKEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this._isLoading = false;
    this.estacion.add(newsResponse.data);

    
    print('si entro');
    print('id presionado: ' + _selectedId.toString());
    print('va en  : ' + estacion.length.toString());
    print('estacion : ' + estacion.length.toString());
    notifyListeners();
  }

 

}
