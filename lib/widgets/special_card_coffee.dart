import 'package:coffe_app/api_services/Coffee_api.dart';
import 'package:coffe_app/models/coffee_model_api.dart';
// import 'package:coffe_app/screens/details.dart';
import 'package:flutter/material.dart';

class customSpecialCoffee extends StatelessWidget {
  const customSpecialCoffee({
    super.key,
    required this.imageSpecialUrl,
  });

  final String imageSpecialUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () async {
          CoffeeServices services = CoffeeServices();
          CoffeeModelApi coffee = await services.getCoffee();
          //Navigator.pushNamed(context, DetailesCoffee.id);
          print(coffee);
        },
        child: Material(
          elevation: 1,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          color: Colors.black45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //width: 200,
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    imageSpecialUrl,
                    width: 170,
                  ),
                ),
              ),
              //const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '5 Coffee Beans You',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      'Must Try!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(6.986)',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130, 20)),
                      child: const Text(
                        'Show',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
