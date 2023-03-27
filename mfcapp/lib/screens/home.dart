// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart' hide Badge, ModalBottomSheetRoute;
import 'package:mfcapp/providers/state.dart';
import 'package:mfcapp/screens/home_screens/about.dart';
import 'package:mfcapp/screens/home_screens/default.dart';
import 'package:mfcapp/screens/home_screens/events.dart';
import 'package:mfcapp/screens/home_screens/gallery.dart';
import 'package:mfcapp/screens/home_screens/other.dart';
import 'package:mfcapp/screens/home_screens/sermon.dart';
import 'package:mfcapp/widgets/home/top_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _widgets = [
    DefaultPage(),
    SermonsPage(),
    GalleryPage(),
    EventPage(),
    AboutPage(),
    OthersPage()
  ];
  @override
  Widget build(BuildContext context) {
    // var topContainerHeight = MediaQuery.of(context).size.height * 0.3;
    var state = Provider.of<StateProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 100,
        leading: Container(
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/mfclogo_square.jpeg'),
                fit: BoxFit.contain),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF091827),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFECECEF),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        height: 80,
                        color: Colors.white,
                        child: TopScreenList(),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onHorizontalDragEnd: (details) {
                          // print(details.primaryVelocity);
                          // Swiping in right direction.
                          if (details.primaryVelocity! > 0) {
                            state.setIndex(state.index - 1);
                          }

                          // Swiping in left direction.
                          if (details.primaryVelocity! < 0) {
                            state.setIndex(state.index + 1);

                          }
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            // shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: [_widgets[state.index]],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
