
import 'package:coffe_app/screens/details.dart';
import 'package:coffe_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/coffee_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.orange),
        routes: {
          HomePage.id: (context) => const HomePage(),
          DetailesCoffee.id: (context) => const DetailesCoffee(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
}
