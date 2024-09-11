import 'package:coffe_app/constants/constant.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/providers/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsCoffeeCard extends StatelessWidget {
  const DetailsCoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CoffeeModel coffeeModel = Provider.of<CoffeeProvider>(context).coffeeData;
    return Container(
      height: 145,
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: const Color.fromARGB(213, 36, 14, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeModel.titleCoffee,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    coffeeModel.description,
                    style: const TextStyle(
                      color: kSecoundryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: kDefultColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${coffeeModel.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(6.986)',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.coffee,
                          color: kDefultColor,
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Coffee',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 13),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 60,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.dew_point,
                          color: kDefultColor,
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Milk',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text(
                  'Medium Rosated',
                  style: TextStyle(color: kSecoundryColor, fontSize: 13),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
