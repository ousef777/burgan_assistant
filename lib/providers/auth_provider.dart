import 'dart:io';
import 'package:burgan_assistant/models/user.dart';
import 'package:burgan_assistant/services/auth.dart';
import 'package:burgan_assistant/services/client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  List<String> token = ["", "", ""]; //"status code", "email", "token"
  User? user;

  void signup({required String email, required String password}) async {
    token[2] = await AuthServices().signup(email: email, password: password);
    //_setToken();
    //print(token);
    notifyListeners();
  }

  void login({required String email, required String password}) async {
    token = await AuthServices().login(email: email, password: password);
    //this.user = user;
    _setToken(token[1], token[2]);
    //print(token);
    notifyListeners();
  }

  bool isAuth() {
    return (user != null);
  }

  Future<void> initAuth() async {
    await _getToken();
    if (isAuth()) {
      //user = User.fromJson({'email': token[1], 'password': token[2]});
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer ${token[2]}',
      };
      //print('Bearer $token');
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
