import 'package:cars_project/presentation/screens/car_details_screen.dart';
import 'package:cars_project/presentation/screens/edit_car_screen.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.id,
      required this.brand,
      required this.model,
      required this.imageUrl,
      required this.year,
      required this.description})
      : super(key: key);

  final int id;
  final String brand;
  final String model;
  final String imageUrl;
  final int year;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(CarDetailScreen.routeName, arguments: id),
      onLongPress: () => Navigator.of(context).pushNamed(EditCarScreen.routeName, arguments: id),
      child: Card(
        elevation: 10,
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage("assets/images/car_placeholder.png"),
            ),
            Text(brand + " " + model),
            Text(year.toString()),
          ],
        ),
      )),
    );
  }
}
