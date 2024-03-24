import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FreshManna extends StatelessWidget {
  const FreshManna({super.key});

  final String freshmanna =
      '''1 Hapo mwanzo Mungu aliziumba mbingu na nchi. 2Nayo nchi ilikuwa ukiwa, tena utupu, na giza lilikuwa juu ya uso wa vilindi vya maji; Roho ya Mungu ikatulia juu ya uso wa maji. 3Mungu akasema, Iwe nuru; ikawa nuru. 4Mungu akaiona nuru, ya kuwa ni njema; Mungu akatenga nuru na giza. 5Mungu akaiita nuru Mchana, na giza akaliita Usiku. Ikawa jioni ikawa asubuhi, siku moja.''';

  @override
  Widget build(BuildContext context) {
    var topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            // spreadRadius: 1,
            // blurRadius: 1,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            context, topContainerHeight, freshmanna);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              freshmanna,
                              style: const TextStyle(fontSize: 18),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '..Read More',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height - topHeight,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/word.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Image(image: AssetImage('assets/images/word.jpg'), fit: BoxFit.cover,),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                      child: Text(
                                        'Mwanzo',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 38,),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: const Divider(
                                        height: 5, thickness: 5, color: Colors.white70,
                                      ),
                                    ),
                                    const Flexible(
                                      child: Text(
                                        '1: 1 - 5',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                              style: const TextStyle(
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
