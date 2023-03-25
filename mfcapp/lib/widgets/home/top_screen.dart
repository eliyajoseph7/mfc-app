import 'package:flutter/material.dart';
import 'package:mfcapp/providers/state.dart';
import 'package:provider/provider.dart';

class TopScreenList extends StatefulWidget {
  TopScreenList({super.key});

  @override
  State<TopScreenList> createState() => _TopScreenListState();
}

class _TopScreenListState extends State<TopScreenList> {
  final List titles = [
    'Home',
    'Sermons',
    'Gallery',
    'Events',
    'About us',
    'Others'
  ];
  // final List images = [
  //   'assets/images/menu_icons/home.jpeg',
  //   'assets/images/menu_icons/sermon.png',
  //   'assets/images/menu_icons/gallery.png',
  //   'assets/images/menu_icons/calendar.jpeg',
  //   'assets/images/menu_icons/about.jpeg',
  //   'assets/images/menu_icons/others.png'
  // ];
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.menu_book_rounded,
    Icons.album_outlined,
    Icons.event_available_outlined,
    Icons.info_outline_rounded,
    Icons.more_horiz
  ];

  var selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<StateProvider>(context);
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedindex = index;
                    state.setIndex(index);
                  }),
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        color: state.index == index
                            ? Colors.blue.shade600
                            : Colors.black54,
                        size: 30,
                      ),
                      FittedBox(
                          child: Text(
                        titles[index],
                        style: TextStyle(
                          color: state.index == index
                              ? Colors.blue.shade600
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 25,
                )
              ],
            ),
          );
        });
  }
}
