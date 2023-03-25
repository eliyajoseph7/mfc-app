import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mfcapp/providers/state.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<StateProvider>(context);
    return GestureDetector(
      onPanUpdate: (details) {
        print(details.delta.dx);
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          // state.setIndex(state.index - 1);
          state.setIndex(3);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          // state.setIndex(state.index + 1);
          state.setIndex(5);
        }
      },
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 4, color: Colors.grey.shade200),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/me.jpeg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jonathan David',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey.shade600,
                                        ),
                                      ),
                                      Text('Senior Pastor',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blueGrey.shade400,
                                              fontStyle: FontStyle.italic))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 2,
                                  margin: const EdgeInsets.only(left: 40),
                                  color: Colors.grey.shade200,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 75,
                                  width: 75,
                                  margin: const EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 4, color: Colors.grey.shade200),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/me.jpeg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Simon Peter',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey.shade600,
                                        ),
                                      ),
                                      Text('Associate Pastor',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blueGrey.shade400,
                                              fontStyle: FontStyle.italic))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text(
                          'Sample Church Name Design',
                          style: TextStyle(
                              fontSize: 35,
                              wordSpacing: 5,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey.shade600),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.35,
                              color: Colors.grey.shade200,
                            ),
                            const Icon(
                              Icons.place,
                              color: Colors.amber,
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.35,
                              color: Colors.grey.shade200,
                            ),
                          ],
                        ),
                        const Text(
                          "Do you love boosting your vocabulary? Do word games help ignite your brain cells? Do you enjoy the thrill of trying to outwit an opponent with your encyclopedic mind? Then, our word generator is a tool that you simply can't live without!",
                          style: TextStyle(
                              fontSize: 22,
                              wordSpacing: 10,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.amber,
                              margin: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: Text(
                                'Mission',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey.shade500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Do you love boosting your vocabulary? Do word games help ignite your brain cells? Do you enjoy the thrill of trying to outwit an opponent with your encyclopedic mind? Then, our word generator is a tool that you simply can't live without!",
                                style: TextStyle(
                                  fontSize: 16,
                                  wordSpacing: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.amber,
                              margin: const EdgeInsets.only(right: 5),
                            ),
                            Flexible(
                              child: Text(
                                'Vision',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey.shade500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Flexible(
                              child: Text(
                                "Do you love boosting your vocabulary? Do word games help ignite your brain cells? Do you enjoy the thrill of trying to outwit an opponent with your encyclopedic mind? Then, our word generator is a tool that you simply can't live without!",
                                style: TextStyle(
                                  fontSize: 16,
                                  wordSpacing: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
