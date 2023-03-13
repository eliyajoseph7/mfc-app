
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    loadPreferences();
  }

  String _userId = '';

  String get userId => _userId;

  savePreferences() async {
    final pref = await SharedPreferences.getInstance();

  }

  loadPreferences() async {
    final pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    if(id != null) {
      _userId = id;
    }
  }
}