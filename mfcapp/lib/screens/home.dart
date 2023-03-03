import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                      'Sample',
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'OpenSans'
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
                                      'Sample Text',
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'OpenSans'
                                      ),
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
                            // child: Image(
                            //   image: NetworkImage(
                            //       'https://www.nicepng.com/png/detail/113-1136930_holy-spirit-dove-png-bible-with-dove-png.png'),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: topContainerHeight - 17),
                  child: SizedBox(
                    height: listHeight,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                          Icons.push_pin,
                                          color: Colors.amber[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          " Fresh Food ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
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
                                            _showModalBottomSheet(
                                                context, topContainerHeight);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '''1 Hapo mwanzo Mungu aliziumba mbingu na nchi. 2Nayo nchi ilikuwa ukiwa, tena utupu, na giza lilikuwa juu ya uso wa vilindi vya maji; Roho ya Mungu ikatulia juu ya uso wa maji. 3Mungu akasema, Iwe nuru; ikawa nuru. 4Mungu akaiona nuru, ya kuwa ni njema; Mungu akatenga nuru na giza. 5Mungu akaiita nuru Mchana, na giza akaliita Usiku. Ikawa jioni ikawa asubuhi, siku moja.''',
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
                                                      child: Text('Read More'),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: const Center(child: Text('JESUS')),
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: const Center(child: Text('IS')),
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: const Center(child: Text('LORD')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                    child: const Center(child: Text('JESUS')),
                                  ),
                                ),
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

  _showModalBottomSheet(context, topHeight) {
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
            ),
          );
        });
  }
}
