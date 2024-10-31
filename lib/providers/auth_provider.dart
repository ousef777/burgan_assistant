import 'dart:io';
import 'package:burgan_assistant/models/user.dart';
import 'package:burgan_assistant/services/auth.dart';
import 'package:burgan_assistant/services/client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  List<String> token = ["", "", ""]; //"error", "email", "token"
  User? user;

  Future<void> signup({required String email, required String password}) async {
    token = await AuthServices().signup(email: email, password: password);
    token[1] = email;
    //_setToken();
    //print(token);
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    token = await AuthServices().login(email: email, password: password);
    //this.user = user;
    _setToken(token[1], token[2]);
    //print(token);
    user = User(email: email, token: token[2]);
    notifyListeners();
  }

  bool isAuth() {
    return (user != null && token[0].isEmpty);
  }

  Future<void> initAuth() async {
    await _getToken();
    if (isAuth()) {
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer ${token[2]}',
      };
      user = User(email: token[1], token: token[2]);
      print('Bearer $token');
      notifyListeners();
    }
  }

  void _setToken(String email, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("token", token);
    notifyListeners();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email");
    var token = prefs.getString("token");

    if (email == null || token == null) return;

    user = User(email: email, token: token);
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('token');
    user = null;
    notifyListeners();
  }
}
