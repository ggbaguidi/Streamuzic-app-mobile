import 'dart:convert';
import 'dart:io';

import 'package:musik/models/data.dart';

class DataProcessor {
  List<DataItems> dataList = [];

  Future<void> loadDataFromJsonFile(String filePath) async {
    try {
      final file = File(filePath);
      final jsonString = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString);

      dataList = jsonList.map((json) => DataItems.fromJson(json)).toList();
    } catch (e) {
      print('Erreur lors de la lecture du fichier JSON : $e');
    }
  }
}
