import 'package:coffe_app/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  CoffeeModel? _coffeeData;

  set coffeeData(CoffeeModel coffee) {
    _coffeeData = coffee;
    notifyListeners();
  }

  CoffeeModel get coffeeData => _coffeeData!;
}
