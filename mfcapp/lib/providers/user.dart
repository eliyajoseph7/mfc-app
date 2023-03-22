import 'package:flutter/material.dart';
import 'package:mfcapp/models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> user = [];
}