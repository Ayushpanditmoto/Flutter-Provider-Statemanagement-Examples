// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _obsSecure = false;
  bool _isAuth = false;

  bool get isLoading => _isLoading;
  bool get obsSecure => _obsSecure;
  bool get isAuth => _isAuth;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setVisible(bool value) {
    _obsSecure = value;
    notifyListeners();
  }

  setAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('Login Successful');
        setLoading(false);
        setAuth(true);
      } else {
        debugPrint('Login Failed');
        setLoading(false);
        setAuth(false);
      }
    } catch (error) {
      debugPrint(error.toString());
      setLoading(false);
      setAuth(false);
    }
  }
}
