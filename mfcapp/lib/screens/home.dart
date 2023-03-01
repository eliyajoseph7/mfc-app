import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
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
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 2,
                          // width: 200,
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
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}
