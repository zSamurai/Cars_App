import 'package:cars_project/data/dummy_data.dart';
import 'package:cars_project/data/models/car_model.dart';

class CarHelper {
  void addCar(Car car) {
    DUMMY_DATA.insert(0, car);
  }


  void removeCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }


  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}
