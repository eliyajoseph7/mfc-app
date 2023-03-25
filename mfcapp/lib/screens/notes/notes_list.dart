import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mfcapp/screens/notes/add_note.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFDDCE),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Notes',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'LobsterTwo'),
                  ),
                  Text(
                    'All..',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  )
                ],
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFDFDDCE),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [Colors.white70, Colors.amber.shade100],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomRight,
        //         tileMode: TileMode.clamp,
        //       ),
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)
        //       ],
        //       borderRadius: BorderRadius.circular(25),
        //       color: Colors.white),
        // ),
      ),
      body: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              ),
              color: Colors.white
            ),
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                // padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: index == 0 ? const EdgeInsets.only(top: 16, bottom: 8) : const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const AddNotePage()),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'This is just a sample header',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              Text(
                                'In the first lesson, the teacher Andre Madarang starts off by explaining why you should learn the library. Shortly speaking',
                                style: TextStyle(color: Colors.grey[700]),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat.yMMMEd()
                                          .format(DateTime.now())
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.Hm()
                                          .format(DateTime.now())
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
                ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddNotePage())),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
    );
  }
}
