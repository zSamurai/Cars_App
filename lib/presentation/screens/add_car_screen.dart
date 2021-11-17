import 'package:cars_project/data/models/car_model.dart';
import 'package:cars_project/data/models/repository/car_helper.dart';
import 'package:flutter/material.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  static const routeName = '/add-car-screen';

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {


  TextEditingController carImageUrl = TextEditingController();
  TextEditingController carID = TextEditingController();
  TextEditingController carBrand = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff28a6f2),
          centerTitle: true,
          title: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: carImageUrl,
                    decoration: InputDecoration(
                      hintText: "Please enter Image URL",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0)),
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
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: carID,
                    decoration: InputDecoration(
                      hintText: "Please enter ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0)),
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
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: carBrand,
                    decoration: InputDecoration(
                      hintText: "Please enter Brand",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0)),
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
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: carYear,
                    decoration: InputDecoration(
                      hintText: "Please enter Year",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0)),
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
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.grey,
                child: TextFormField(
                    controller: carDescription,
                    decoration: InputDecoration(
                      hintText: "Please enter Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0)),
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
                  elevation: 10,
                    height: 50,
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("BACK"),
                    color: const Color(0xff28A6F2),
                    textColor: Colors.white),
                MaterialButton(
                  elevation: 10,
                    height: 50,
                    onPressed: () {
                      setState(() {
                        var car = Car(
                            id: int.parse(carID.text),
                            brand: carBrand.text,
                            model: carModel.text,
                            imageUrl: carImageUrl.text,
                            year: int.parse(carYear.text),
                            description: carDescription.text);
                        CarHelper().addCar(car);
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text("ADD"),
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
