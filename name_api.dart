import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class NameAPI {

  String? named; //name of the person
  int? age = 0; //age of the person
  int? count = 0; //amount of people with that name

  NameAPI(String text);

  Future<void> getAge(String name) async {
    try {
      String apiurl = 'https://api.agify.io?name=$name';
      final Uri url2 = Uri.parse(apiurl);
      Response response = await get(url2);
      Map data = jsonDecode(response.body);

      //get properties from data
      named = data['name'];
      age = data['age'];
      count = data['count'];
      print(age);
    }

    catch (e) {
      print('caught error: $e');
    }

  }

}