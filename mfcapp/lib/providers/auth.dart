
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mfcapp/screens/chart.dart';
import 'package:mfcapp/screens/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    loadPreferences();
  }

  bool _loading = false;
  bool _isLogedin = false;

  bool get isLoading => _loading;
  bool get isLogedin=> _isLogedin;

  isUserLogedin() async {

    final pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    if(id != null) {
      setisLogedin(true);
    } else {
      setisLogedin(false);
    }
  }

  void setLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  void setisLogedin(bool value) {
    _isLogedin = value;
    // print('valueeeeee is ${value}');
    notifyListeners();
  }

  savePreferences(var userId, var name, var phone) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('userId', userId);
    pref.setString('name', name);
    pref.setString('phone', phone);


    if(userId != null) {
      setisLogedin(true);
    } else {
      setisLogedin(false);
    }
  }

  loadPreferences() async {
    final pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    if(id != null) {
      setisLogedin(false);
    }
  }

  Future<User?> login(String email, String password, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

      savePreferences(user?.uid, user?.displayName, password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ChatPage()));
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found') {
        print('user not found');
      }
    }

    setLoading();
    print(user);
    return user;
  }


  Future<User?> register(String email, String password, String name, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      savePreferences(user?.uid, user?.displayName, password);
      
      // user!.updatePhoneNumber(password as PhoneAuthCredential);
      user!.updateDisplayName(name);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ChatPage()));
    } on FirebaseAuthException catch(e) {
      print(e);
      if(e.code == 'email-already-in-use') {
        print('phone number exists');
      } 
    }
    setLoading();
    return user;
  }

  logout(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    
    final pref = await SharedPreferences.getInstance();
    pref.remove('userId');
    pref.remove('name');
    pref.remove('phone');

    setisLogedin(false);
    Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const IndexPage(),
                              ),
                            );
  }
}