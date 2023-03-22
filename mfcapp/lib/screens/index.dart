import 'dart:async';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:mfcapp/providers/auth.dart';
import 'package:mfcapp/screens/auth/login.dart';
import 'package:mfcapp/screens/chart.dart';
import 'package:mfcapp/screens/more.dart';
import 'package:mfcapp/screens/home.dart';
import 'package:mfcapp/screens/new_chart.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var auth = Provider.of<AuthProvider>(context, listen: false);
      auth.isUserLogedin();
    });
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
              _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
              _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }
      // 2.
      setState(() {});
      // 3.
      string == 'Offline' ?
      MotionToast.warning(
        title: Text(string),
        description: const Text(""),
        height: 30,
        layoutOrientation: ToastOrientation.rtl,
        animationType: AnimationType.fromRight,
        width: 200,
        position: MotionToastPosition.top,
      ).show(context) : MotionToast.success(
        title: Text(string),
        description: const Text(""),
        height: 30,
        layoutOrientation: ToastOrientation.rtl,
        animationType: AnimationType.fromRight,
        width: 200,
        position: MotionToastPosition.top,
      ).show(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       string,
      //       style: TextStyle(fontSize: 16),
      //     ),
      //   ),
      // );
    });
  }

  // final ScrollController __homeController = ScrollController();
  var selectedIndex = 0;
  var userId;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    var bottomBarHeight = MediaQuery.of(context).size.height * 0.08;
    var auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        height: bottomBarHeight,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, spreadRadius: 10, blurRadius: 1)
            ],
            color: Colors.amber),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'More'),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[700],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (int value) {
            setState(() {
              selectedIndex = value;
            });
            switch (value) {
              case 0:
                // if (value == selectedIndex) {
                //   __homeController.animateTo(0.0,
                //       duration: Duration(microseconds: 500),
                //       curve: Curves.bounceIn);
                // }
                break;
              // case 1:
              //   MorePage();
              // break;
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  auth.isLogedin ? ChatScreen() : const LoginPage(),
            ),
          );
        },
        child: const Badge(
          badgeAnimation: BadgeAnimation.rotation(
            toAnimate: true,
            animationDuration: Duration(seconds: 3),
          ),
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(
            Icons.message_rounded,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
