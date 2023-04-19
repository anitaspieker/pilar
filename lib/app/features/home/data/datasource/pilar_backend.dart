import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pilar/app/features/home/domain/entities/response.dart';

class PilarBackend {
  static Future<Response> handleRequest() async {
    try {
      final response = await rootBundle.loadString('assets/response.json');
      final jsonResponse = jsonDecode(response);
      var list = [];
      var num = [];
      var number = 0;
      for (var i in jsonResponse){
        number += 1;
        if(i is! Map<String, dynamic>){
          num.add(number);
          list.add(i);
        } 
      }

      return Response(status: HttpStatus.ok, json: jsonResponse);
    } catch (error) {
      print(error);
      return Response(status: HttpStatus.notFound);
    }
  }
}
