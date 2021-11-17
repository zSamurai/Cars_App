import 'package:cars_project/data/dummy_data.dart';
import 'package:cars_project/data/models/car_model.dart';
import 'package:cars_project/data/models/repository/car_helper.dart';
import 'package:flutter/material.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({Key? key}) : super(key: key);

  static const routeName = '/edit-car-screen';

  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditCarScreen> {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as int;
    final selectedCar = carList.firstWhere((car) => car.id == carId);

    final TextEditingController _imageUrlController =
        TextEditingController(text: selectedCar.imageUrl);
    final TextEditingController _idController =
        TextEditingController(text: selectedCar.id.toString());
    final TextEditingController _brandController =
        TextEditingController(text: selectedCar.brand);
    final TextEditingController _modelController =
        TextEditingController(text: selectedCar.model);
    final TextEditingController _yearController =
        TextEditingController(text: selectedCar.year.toString());
    final TextEditingController _descriptionController =
        TextEditingController(text: selectedCar.description);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff0c76bb),
          centerTitle: true,
          title: const Text(
            'Edit',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _imageUrlController,
                    decoration: InputDecoration(
                      hintText: "Car Image URL",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      hintText: "Car ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _brandController,
                    decoration: InputDecoration(
                      hintText: "Car Brand",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _modelController,
                    decoration: InputDecoration(
                      hintText: "Car Model",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _yearController,
                    decoration: InputDecoration(
                      hintText: "Car Year",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: "Car Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty) {
                      } else {
                        return "Please fill the field";
                      }
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("BACK"),
                    color: const Color(0xff28A6F2),
                    textColor: Colors.white),
                MaterialButton(
                    height: 40,
                    onPressed: () {
                      setState(() {
                        var car = Car(
                            id: int.parse(_idController.text),
                            brand: _brandController.text,
                            model: _modelController.text,
                            imageUrl: _imageUrlController.text,
                            year: int.parse(_yearController.text),
                            description: _descriptionController.text);
                        CarHelper().editCar(car, carList.indexOf(selectedCar));
                        Navigator.of(context).pop(false);
                      });
                    },
                    child: const Text("EDIT"),
                    color: const Color(0xff28A6F2),
                    textColor: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}
