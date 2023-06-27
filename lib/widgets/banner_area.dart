import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BannerArea extends StatelessWidget {
  BannerArea({super.key});

  Future<String> _loadJSONData() async {
    return await rootBundle.loadString('data.json');
  }

  final List<Widget> bannerList = [];
  // Widget foodColumn;

  Future<void> parseJSONData() async {
    String jsonData = await _loadJSONData();
    List<dynamic> data = json.decode(jsonData);

    for (int i = 0; i < data.length; i++) {
      final Widget bannerView = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 71, 70, 70),
                    offset: Offset(2, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
              child: Image.asset(
                data[i]['placeImage'],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[i]['placeName'],
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'More than ${data[i]['minOrder']}% off',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

      bannerList.add(bannerView);
    }
  }

  void func() async => await parseJSONData();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    func();

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 6 / 16,
          width: screenWidth,
          child: PageView(
            controller: PageController(
              initialPage: 3,
              viewportFraction: 0.8,
            ),
            scrollDirection: Axis.horizontal,
            children: bannerList,
          ),
        ),
        SizedBox(
          height: screenHeight - (screenHeight * 8 / 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 236, 228, 199),
                        Color.fromARGB(255, 248, 219, 131),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                            child: Image.asset(
                              'images/hawkers.jpg',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Hawkers',
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: 'Samantha',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Taste the Ultimate!!!',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 225, 250, 210),
                        Color.fromARGB(255, 165, 228, 149),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                            child: Image.asset(
                              'images/burger.jpg',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Burger',
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: 'Samantha',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Want something mouthfull?',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines:
                                    2, // Set the maximum number of lines to display
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 236, 217, 199),
                        Color.fromARGB(230, 230, 180, 157),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                            child: Image.asset(
                              'images/noodles.jpg',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Noodles',
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: 'Samantha',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Tasty.. Noodles..',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 236, 228, 199),
                        Color.fromARGB(255, 248, 219, 131),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                            child: Image.asset(
                              'images/pizza.jpg',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pizzaa...',
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: 'Samantha',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'There\'s nothing like a pizza...',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 211, 237, 241),
                        Color.fromARGB(255, 185, 241, 229),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              bottomLeft: Radius.circular(
                                20,
                              ),
                            ),
                            child: Image.asset(
                              'images/flipping.jpg',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Flipping',
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: 'Samantha',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'It\'s delicious!!!',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
