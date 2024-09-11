import 'package:coffe_app/constants/constant.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/providers/coffee_provider.dart';
import 'package:coffe_app/screens/details.dart';
import 'package:coffe_app/widgets/coffee_card.dart';
import 'package:coffe_app/widgets/coffee_type.dart';
import 'package:coffe_app/widgets/special_card_coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'home page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CoffeeModel> coffeeList = [
    CoffeeModel(
      imageUrl: 'assets/images/coffee-glass-beverage-coffee-mug-162886.jpg',
      titleCoffee: 'Cappuccino',
      price: 8.5,
      description: 'with Milk',
      isSelected: true,
    ),
    CoffeeModel(
      imageUrl: 'assets/images/istockphoto-995466956-612x612.jpg',
      titleCoffee: 'Espresso',
      price: 4.20,
      description: 'with Milk',
      isSelected: false,
    ),
    CoffeeModel(
      imageUrl: 'assets/images/coffee-glass-beverage-coffee-mug-162886.jpg',
      titleCoffee: 'Late',
      price: 10.6,
      description: 'with Milk',
      isSelected: false,
    ),
    CoffeeModel(
      imageUrl: 'assets/images/coffee-glass-beverage-coffee-mug-162886.jpg',
      titleCoffee: 'Black',
      price: 15.6,
      description: 'with Milk',
      isSelected: false,
    ),
    CoffeeModel(
      imageUrl: 'assets/images/coffee-glass-beverage-coffee-mug-162886.jpg',
      titleCoffee: 'Tea',
      price: 20.6,
      description: 'with Milk',
      isSelected: false,
    ),
  ];

  coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeList.length; i++) {
        coffeeList[i].isSelected = false;
      }
      coffeeList[index].isSelected = true;
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      // AppBar..
      appBar: AppBar(
        backgroundColor: Colors.transparent, // make color like back
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(235, 29, 28, 28),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 9, bottom: 10, top: 8),
            child: const Icon(
              Icons.grid_view_rounded,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              //color: Colors.green,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(235, 29, 28, 28),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation bar..
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          elevation: 5,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          iconSize: 27,
          selectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: '',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: '',
                backgroundColor: kPrimaryColor),
          ],
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
        ),
      ),
      //body
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Find the best coffee for you',
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                ),
                const SizedBox(height: 25),
                // search Bar..
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find your coffee..',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kSecoundryColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // horizontal listview coffee..
                Container(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      return CustomCoffeeType(
                        coffeeType: coffeeList[index].titleCoffee,
                        isSelected: coffeeList[index].isSelected,
                        onTap: () {
                          coffeeTypeSelected(index);
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          Provider.of<CoffeeProvider>(context, listen: false)
                              .coffeeData = coffeeList[index];
                          print(coffeeList[index].titleCoffee);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailesCoffee(),
                            ),
                          );
                        },
                        child: CustomCoffeeTile(
                          coffeeName: coffeeList[index].titleCoffee,
                          coffeePrice: coffeeList[index].price,
                          coffeeImagePath: coffeeList[index].imageUrl,
                          coffeeDescription: coffeeList[index].description,
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Special for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 300,
                        child: ListView(
                          children: const [
                            customSpecialCoffee(
                                imageSpecialUrl:
                                    'assets/images/pexels-photo-14283634.jpg'),
                            customSpecialCoffee(
                                imageSpecialUrl:
                                    'assets/images/pexels-photo-290975.jpg'),
                            customSpecialCoffee(
                                imageSpecialUrl:
                                    'assets/images/pexels-photo-326869.jpg'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
