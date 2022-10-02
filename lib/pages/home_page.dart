// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of coffee types
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ]
  ];

  //user tapped on coffee types
  void coffeeTypesSelected(int index) {
    setState(() {
      // this for loop make everyselection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[1][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.white,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ],
        ),
        body: Column(
          children: [
            //Find the best coffee for you
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Find the best coffee for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            // horizontal listView of coffee typeps
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypesSelected(index);
                    },
                  );
                },
              ),
            ),

            //horizontal listview of coffee lines
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/latta.png',
                    coffeeName: 'Latta',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/cappucino.png',
                    coffeeName: 'Cappucino',
                    coffeePrice: '4.34',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/milk.png',
                    coffeeName: 'Milk',
                    coffeePrice: '4.45',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
