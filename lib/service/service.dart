import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class Service {
  static Future<List<dynamic>> getJsonData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data.json');
      return jsonDecode(jsonString);
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}