import 'package:cars_project/presentation/screens/car_details_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/screens.dart';

void main() {
  runApp(const CarsApp());
}

class CarsApp extends StatelessWidget {
  const CarsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {AddCarScreen.routeName: (ctx) => const AddCarScreen(),
        CarDetailScreen.routeName: (ctx) => const CarDetailScreen(),
        EditCarScreen.routeName: (ctx) => const EditCarScreen(),
      },
    );
  }
}
