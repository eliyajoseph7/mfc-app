// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart' hide Badge, ModalBottomSheetRoute;
import 'package:mfcapp/widgets/home/manna.dart';
import 'package:mfcapp/widgets/home/schedule.dart';
import 'package:mfcapp/widgets/home/top_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: topContainerHeight,
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  'Holy Spirit',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LobsterTwo'),
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  'Breath in Me',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DancingScript'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/dove.png'),
                          ),
                        ),
                      ),
                    ],
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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Color(0xFFECECEF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: TopMenu(),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 160,
                          color: Color(0xFFECECEF),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      color: Colors.white70),
                                  child: Column(children: [
                                    ChurchSchedule(),
                                    FreshManna(),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
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
