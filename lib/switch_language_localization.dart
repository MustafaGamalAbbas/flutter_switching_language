
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
class MyAppLocalization {
  static Map<String, String> _localizedStrings;

  static Future<bool> load(String language) async {
    // Load the language JSON file from the "lang" folder
     String lanuageCode =  language.toLowerCase().contains("en")? "en" : "ar";
    String jsonString = await rootBundle.loadString('lang/$lanuageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);


    _localizedStrings = jsonMap.map((key, value) {
      print(key + " "+ value);
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  static String translate(String key) {
    print(key + " v "+ _localizedStrings[key]);
    return _localizedStrings[key];
  }
}
