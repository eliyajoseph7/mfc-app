import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge, ModalBottomSheetRoute;
import 'package:mfcapp/screens/notes/notes_list.dart';
import 'package:mfcapp/screens/teachings/teach_list.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({super.key});

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      // padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const TeachListPage())),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          size: 50,
                          color: Colors.amber,
                        ),
                        Text(
                          'Somo Jipya'.toUpperCase(),
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 7,
                    right: 7,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Badge(
                        badgeAnimation: BadgeAnimation.rotation(
                          toAnimate: true,
                          animationDuration: Duration(seconds: 3),
                        ),
                        badgeContent: Text(
                          '3',
                          style: TextStyle(color: Colors.white),
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
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const MyNotes())),
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
                    colors: [Colors.white, Colors.amber.shade100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
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
                    colors: [Colors.white, Colors.amber.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.mirror),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
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
    );
  }
}
