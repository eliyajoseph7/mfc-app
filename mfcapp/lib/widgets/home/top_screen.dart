import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopScreenList extends StatefulWidget {
  TopScreenList({super.key});

  @override
  State<TopScreenList> createState() => _TopScreenListState();
}

class _TopScreenListState extends State<TopScreenList> {
  final List titles = ['About us', 'Events', 'Gallery', 'Adverts', 'Others'];
  final List images = ['assets/images/menu_icons/about.png', 'assets/images/menu_icons/calendar.png', 'assets/images/menu_icons/gallery.png', 'assets/images/menu_icons/speaker.png', 'assets/images/menu_icons/others.png'];

  var selectedindex = 0;

  @override
  Widget build(BuildContext context) {
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
                  }),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            selectedindex == index ? BoxShadow(
                              color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 3
                            ) : const BoxShadow()
                          ]
                        ),
                        child: AvatarView(
                          radius: 35,
                          borderWidth: selectedindex == index ? 4.5 : 3.0,
                          borderColor: selectedindex == index ? Colors.purple[700] : Colors.white70,
                          avatarType: AvatarType.CIRCLE,
                          backgroundColor: Colors.grey,
                          imagePath: images[index],
                        ),
                      ),
                      FittedBox(
                          child: Text(
                        titles[index],
                        style: TextStyle(
                          color: selectedindex == index ? Colors.blueGrey[700] : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                )
              ],
            ),
          );
        });
  }
}
