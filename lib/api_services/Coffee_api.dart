import 'dart:convert';

import 'package:coffe_app/models/coffee_model_api.dart';
import 'package:http/http.dart' as http;

class CoffeeServices {
  String baseUrlcoffee = 'https://api.sampleapis.com';
  Future<CoffeeModelApi> getCoffee() async {
    http.Response response = await http.get(Uri.parse('$baseUrlcoffee/hot'));

    List<dynamic> coffeeData =
        jsonDecode(response.body); // convert String data to jsondecode..

    CoffeeModelApi coffee = CoffeeModelApi.fromJson(coffeeData);
    return coffee;

  }
}
