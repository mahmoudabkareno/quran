import 'package:quran/Models/Employye.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const url = "http://dummy.restapiexample.com/";

class GetEmployee {
  String getPath() {
    return url + "api/v1/employees";
  }

  Future<List<Employees>> getEmployees() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      List data = json['data'];
      return data.map((employees) => Employees.fromJson(employees)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}