import 'package:burgan_assistant/services/client.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<List<String>> signup(
      {required String email, required String password}) async {
    List<String> token = ["", "", ""];
    try {
      Response response = await Client.dio.post('/signup', data: {
        "email": email,
        "password": password,
      });
      token[2] = response.data["data"]["token"];
      print(token);
    } on DioException catch (error) {
      token[0] = "${error.response!.data["message"]}";
      //print(error);
    }
    return token;
  }

  Future<List<String>> login(
      {required String email, required String password}) async {
    List<String> token = ["", "", ""]; //"status code", "email", "token"
    try {
      Response response = await Client.dio.post('/login',
          data: <String, dynamic>{"email": email, "password": password});
      token[1] = response.data["data"]["user"];
      token[2] = response.data["data"]["token"];
      print(token);
    } on DioException catch (error) {
      //print(error.response!.data["message"]);
      //print(error.response!.statusCode);
      token[0] = "${error.response!.data["message"]}";
    }
    return token;
  }
}
