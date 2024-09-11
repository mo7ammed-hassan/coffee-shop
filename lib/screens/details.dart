import 'package:coffe_app/constants/constant.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/providers/coffee_provider.dart';
import 'package:coffe_app/widgets/details_card.dart';
import 'package:coffe_app/widgets/details_elvetedButtom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailesCoffee extends StatefulWidget {
  const DetailesCoffee({super.key});
  static String id = 'DetailesCoffee';

  @override
  State<DetailesCoffee> createState() => _DetailesCoffeeState();
}

class _DetailesCoffeeState extends State<DetailesCoffee> {
  bool isReadMore = false;
  List sizeCoffeeList = [
    ['S', true],
    ['M', false],
    ['L', false],
  ];

  coffeeSizeSelected(int index) {
    setState(() {
      for (int i = 0; i < sizeCoffeeList.length; i++) {
        sizeCoffeeList[i][1] = false;
      }
      sizeCoffeeList[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CoffeeModel? coffeeModel = Provider.of<CoffeeProvider>(context).coffeeData;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.arrow_back_ios, color: kSecoundryColor),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.favorite, color: kSecoundryColor),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                // fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: AssetImage(coffeeModel.imageUrl),
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(27),
                  bottomRight: Radius.circular(27)),
            ),
            child: const Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  child: DetailsCoffeeCard(),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 15, right: 15, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(color: kSecoundryColor, fontSize: 16),
                  ),
                  Text(
                    maxLines: isReadMore ? 8 : 2,
                    overflow: TextOverflow.ellipsis,
                    'A cappuccino is a coffee-based drink made primarily from espresso and milk A cappuccino is a coffee-based drink made primarily from espresso ',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 17, height: 1.3),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isReadMore = !isReadMore;
                      });
                    },
                    child: Text(
                      isReadMore ? 'Read Less' : 'Read More',
                      style: const TextStyle(color: kDefultColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(
                          color: kSecoundryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 35,
                        // color: Colors.amber,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizeCoffeeList.length,
                          itemBuilder: (context, index) {
                            return DetailsCustomElvetedButtom(
                              sizeText: sizeCoffeeList[index][0],
                              isSelected: sizeCoffeeList[index][1],
                              onPressed: () {
                                coffeeSizeSelected(index);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: kSecoundryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$ 4.20',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 108, 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
