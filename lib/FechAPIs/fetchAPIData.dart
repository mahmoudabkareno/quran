import 'package:http/http.dart' as http;
import 'package:quran/Models/Elfatiha.dart';
import 'dart:convert';
import 'package:quran/Models/Sorah.dart';

String fatihaname = '';

class fetchAPIData {
  static Future<List<Sorah>> getApi() async {
    http.Response response =
        await http.get('http://api.alquran.cloud/v1/surah');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List data = json['data'];
      var finalList = data.map((sorah) => Sorah.fromJson(sorah)).toList();
      return finalList;
    }
  }

  static Future<List<ElFatiha>> getApiElfatiha() async {
    http.Response response =
    await http.get('https://unpkg.com/quran-json@1.0.1/json/surahs/1.json');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var namee = json['name'];
      fatihaname = namee;
      List data = json['verses'];
      var finalList = data.map((aya) => ElFatiha.fromJson(aya)).toList();
      return finalList;
    }
  }
}
