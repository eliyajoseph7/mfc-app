// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Badge, ModalBottomSheetRoute;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mfcapp/screens/notes/notes_list.dart';
import 'package:mfcapp/screens/teachings/teach_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  String freshmanna =
      '''1 Hapo mwanzo Mungu aliziumba mbingu na nchi. 2Nayo nchi ilikuwa ukiwa, tena utupu, na giza lilikuwa juu ya uso wa vilindi vya maji; Roho ya Mungu ikatulia juu ya uso wa maji. 3Mungu akasema, Iwe nuru; ikawa nuru. 4Mungu akaiona nuru, ya kuwa ni njema; Mungu akatenga nuru na giza. 5Mungu akaiita nuru Mchana, na giza akaliita Usiku. Ikawa jioni ikawa asubuhi, siku moja.''';
  @override
  Widget build(BuildContext context) {
    var topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    var bottomBarHeight = MediaQuery.of(context).size.height * 0.08;
    var listHeight = MediaQuery.of(context).size.height -
        (topContainerHeight + 28 + bottomBarHeight);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Stack(
              children: [
                Container(
                  height: topContainerHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0),
                                    child: Text(
                                      'Holy Spirit',
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LobsterTwo'
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0),
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
                                image:
                                    ExactAssetImage('assets/images/dove.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: topContainerHeight - 7),
                  child: SizedBox(
                    height: listHeight,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: ListView(
                            shrinkWrap: true,
                            // padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TeachListPage())),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 1,
                                            blurRadius: 10)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      // gradient:  LinearGradient(
                                      //   colors: [Colors.amber.shade50, Colors.white],
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      //   tileMode: TileMode.clamp,
                                      // ),
                                      color: Colors.white,
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.menu_book_rounded,
                                                size: 50,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                'Somo Jipya'.toUpperCase(),
                                                style: TextStyle(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 7,
                                          right: 7,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: Badge(
                                              badgeAnimation:
                                                  BadgeAnimation.rotation(
                                                toAnimate: true,
                                                animationDuration:
                                                    Duration(seconds: 3),
                                              ),
                                              badgeContent: Text(
                                                '3',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              child: Icon(
                                                Icons.notification_add_rounded,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyNotes())),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 1,
                                              blurRadius: 10)
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.amber.shade100
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomRight,
                                          tileMode: TileMode.clamp,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.speaker_notes_rounded,
                                            color: Colors.amber,
                                            size: 50,
                                          ),
                                          Text('Notes'.toUpperCase()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            spreadRadius: 1,
                                            blurRadius: 10)
                                      ],
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.amber.shade50
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          tileMode: TileMode.mirror),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.library_books_rounded,
                                          color: Colors.amber,
                                          size: 50,
                                        ),
                                        Text(
                                          'Bible'.toUpperCase(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1,
                                        blurRadius: 10)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: CarouselSlider.builder(
                                      itemCount: imgList.length,
                                      options: CarouselOptions(
                                          autoPlay: true,
                                          enlargeCenterPage: true,
                                          viewportFraction: 1,
                                          aspectRatio: 16 / 9,
                                          autoPlayInterval:
                                              Duration(seconds: 3),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 1000),
                                          enlargeFactor: 0.7),
                                      itemBuilder: (context, index, realIndex) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    imgList[index]),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(),
                                        );
                                      },
                                      // items: imgList.map((item) {
                                      //   return Builder(
                                      //     builder: (BuildContext context,) {
                                      //     },
                                      //   );
                                      // }).toList(),
                                    ),
                                  ),
                                  Positioned(
                                    top: 3,
                                    left: 5,
                                    child: Text(
                                      'Ratiba'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('JESUS'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 1,
                                      blurRadius: 1)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Icon(
                                          Icons.sunny,
                                          color: Colors.amber[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          " Fresh Manna ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // fontStyle: FontStyle.italic,
                                              fontFamily: 'LobsterTwo',
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'This is Sample Text header',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            _showModalBottomSheet(context,
                                                topContainerHeight, freshmanna);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  freshmanna,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: Text(
                                                        '..Read More',
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .italic),
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 2,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet(context, topHeight, word) {
    showMaterialModalBottomSheet(
        context: context,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              height: MediaQuery.of(context).size.height - topHeight,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/word1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Image(image: AssetImage('assets/images/word.jpg'), fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75 - 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              word,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
