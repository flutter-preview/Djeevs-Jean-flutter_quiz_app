import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class Service {
  static Future<List<dynamic>> getJsonData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json.data');
      return json.decode(jsonString);
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}