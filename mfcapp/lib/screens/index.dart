import 'package:flutter/material.dart';
import 'package:mfcapp/screens/more.dart';
import 'package:mfcapp/screens/home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // final ScrollController __homeController = ScrollController();
  var selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[HomePage(), MorePage()];
  @override
  Widget build(BuildContext context) {
    var bottomBarHeight = MediaQuery.of(context).size.height * 0.08;
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
    );
  }
}
