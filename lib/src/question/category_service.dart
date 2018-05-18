import 'dart:async';
import 'dart:html';
import 'dart:convert';

import 'package:gvq_admin_ui/src/question/category.dart';

class CategoryService {
  String _url = 'http://localhost:8000/categories';

  Future<List<Category>> getAll() async {
    HttpRequest request = await HttpRequest.request(this._url, method: 'GET');

    if (request.status != 200) {
      return null;
    }

    List<Category> categories = new List<Category>();
    json.decode(request.responseText).forEach((category) {
      categories.add(new Category.fromMap(category));
    });

    return categories;
  }
}