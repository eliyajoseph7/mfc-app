import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateProvider with ChangeNotifier {

  StateProvider() {
    loadPreferences();
  }

  int _index = 0;

  int get index => _index;

  void setIndex(int value) async {
    if(value > -1 && value < 6) {
    _index = value;
    await savePreferences(value);

    }
    print('Selected index is $value');
    notifyListeners();
  }

  savePreferences(var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('tab-index', value.toString());
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var index = prefs.getString('tab-index');
    
    setIndex(int.parse(index!));
    // setIndex(0);
  }
}