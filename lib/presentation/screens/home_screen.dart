import 'package:cars_project/data/dummy_data.dart';
import 'package:cars_project/data/models/car_model.dart';
import 'package:cars_project/presentation/screens/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'add_car_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cars Catalog"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddCarScreen.routeName);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final currentCar = carList[index];
                return ListItem(
                    id: currentCar.id,
                    brand: currentCar.brand,
                    model: currentCar.model,
                    imageUrl: currentCar.imageUrl,
                    year: currentCar.year,
                    description: currentCar.description);

            },
            itemCount: carList.length,
          ),
        ));
  }
}
