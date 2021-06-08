import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/models/property.dart';
import 'package:http/http.dart' as http;

class PropertiesServices {
  var properties = [
  
  ];
  getAll() async {
    properties = [];
    var url =
        Uri.parse('https://prop-back.000webhostapp.com/api/properties/getAlls');

    var response = await http.get(url);
    
    dynamic propertiesJson = jsonDecode(response.body);
    print(propertiesJson);
    for (var p in propertiesJson) {
      properties.add(Property.fromJson(p));
    }
    print(properties.length);
    return properties;
  }

  store(data) async {
    print(data);
    var url =
        Uri.parse('https://prop-back.000webhostapp.com/api/properties/store');
    var response = await http.post(url, body: data);
    print(response.statusCode);
    debugPrint(response.toString());
    // print(response);

    return response;
  }
}
