import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:mfcapp/providers/auth.dart';
import 'package:mfcapp/screens/auth/login.dart';
import 'package:mfcapp/screens/chart.dart';
import 'package:mfcapp/screens/more.dart';
import 'package:mfcapp/screens/home.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // final ScrollController __homeController = ScrollController();
  var selectedIndex = 0;
  var userId;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MorePage()
  ];
  @override
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var auth = Provider.of<AuthProvider>(context, listen: false);
      auth.isUserLogedin();
    });
  }

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
            builder: (BuildContext context) =>  auth.isLogedin ? const ChatPage() : const LoginPage(),
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
}
