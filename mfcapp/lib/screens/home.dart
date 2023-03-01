import 'package:flutter/material.dart';
import 'package:mfcapp/screens/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    var listHeight = MediaQuery.of(context).size.height - (topContainerHeight + 28);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Stack(
              children: [
                Container(
                  height: topContainerHeight,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
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
                                  child: Text(
                                    'Sample',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      // fontFamily: 'OpenSans'
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    'Sample Text',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      // fontFamily: 'OpenSans'
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
                const Positioned(
                  top: 2,
                  right: 8,
                  child: CircleAvatar(
                    child: Icon(Icons.person_rounded),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: listHeight,
            child: ListView(),
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
