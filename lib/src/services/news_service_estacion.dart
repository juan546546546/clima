// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:newsapp/src/models/category_model.dart';
// import 'package:newsapp/src/models/clima_models.dart';
// import 'package:http/http.dart' as http;

// final _URL_NEWS = 'https://api.waqi.info';
// final _APIKEY = '84f345500b6e45baa97fc82af26df243bc24e458';

// class NewsServicesssssssss with ChangeNotifier {
//   List<Data> headlines = [];
//   String _selectedCategory = 'mexico';

//   bool _isLoading = true;

//   List<Category> categories = [
//     Category(FontAwesomeIcons.building, 'mexico'),
//     Category(FontAwesomeIcons.tv, 'entertainment'),
//     Category(FontAwesomeIcons.addressCard, 'general'),
//     Category(FontAwesomeIcons.headSideVirus, 'health'),
//     Category(FontAwesomeIcons.vials, 'science'),
//     Category(FontAwesomeIcons.volleyballBall, 'sports'),
//     Category(FontAwesomeIcons.memory, 'technology'),
//   ];

//   Map<String, List<Data>> categoryArticles = {};

//   NewsService() {
//     this.getTopHeadlines();

//     categories.forEach((item) {
//       this.categoryArticles[item.name] = new List();
//     });

//     this.getArticlesByCategory(this._selectedCategory);
//   }

//   bool get isLoading => this._isLoading;

//   get selectedCategory => this._selectedCategory;
//   set selectedCategory(String valor) {
//     this._selectedCategory = valor;

//     this._isLoading = true;
//     this.getArticlesByCategory(valor);
//     notifyListeners();
//   }

//   List<Data> get getArticulosCategoriaSeleccionada =>
//       this.categoryArticles[this.selectedCategory];

//   getTopHeadlines() async {
//     final url = '$_URL_NEWS/feed/mexico/?token=$_APIKEY';
//     final resp = await http.get(url);

//     final newsResponse = newsResponseFromJson(resp.body);

//     this.headlines.add(newsResponse.data);
//     notifyListeners();
//   }

//   getArticlesByCategory(String category) async {
//     if (this.categoryArticles[category].length > 0) {
//       this._isLoading = false;
//       notifyListeners();
//       return this.categoryArticles[category];
//     }

//     // final url = '$_URL_NEWS/feed/mexico/?token=$_APIKEY';
//     // final resp = await http.get(url);

//     // final newsResponse = newsResponseFromJson(resp.body);

//     // this.categoryArticles[category].add(newsResponse.data);

//     // this._isLoading = false;
//     // notifyListeners();
//   }
// }
