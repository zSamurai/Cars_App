import 'package:cars_project/data/dummy_data.dart';
import 'package:cars_project/data/models/repository/car_helper.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/car-details-screen';

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as int;
    final car = DUMMY_DATA.firstWhere((car) => car.id == carId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars Catalog"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Delete'),
                content: const Text('Do you want to delete this object?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        CarHelper().removeCar(carId);
                        Navigator.of(context).pushNamed("/");
                      });
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: SingleChildScrollView(
                      child: Image.network(
                        car.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      scrollDirection: Axis.horizontal,
                    )),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Brand:", style: TextStyle(fontSize: 25)),
                      Text(car.brand, style: const TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Model:", style: TextStyle(fontSize: 25)),
                      Text(car.model, style: const TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Year:", style: TextStyle(fontSize: 25)),
                      Text(car.year.toString(), style: const TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(child: Text(car.description, style: const TextStyle(fontSize: 25))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
