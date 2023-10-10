import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'darting.freezed.dart';
part 'darting.g.dart';

void main() async {
  var url = Uri.https('myfakeapi.com','/api/cars/');
  var response = await http.get(url);
  var map = jsonDecode(response.body);
  // List<Car> carList = List.empty();
  var list = map["cars"];
  var carList = <Car>[];
  for (var o in list) {
    Map<String, dynamic> a = o;
    print('$a \n');
    carList.add(Car.fromJson(a));
  }
}



@freezed
class Car with _$Car {
  const factory Car({
    required int id,
    required String car,
    required String car_model,
    required String car_color,
    required String car_vin,
    required String price,
    required bool availability
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json)
  => _$CarFromJson(json);
}