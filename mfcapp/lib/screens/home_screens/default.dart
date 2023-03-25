import 'package:flutter/material.dart';
import 'package:mfcapp/widgets/home/manna.dart';
import 'package:mfcapp/widgets/home/schedule.dart';
import 'package:mfcapp/widgets/home/top_menu.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xFFECECEF),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
              top: 8.0,
            ),
            child: TopMenu(),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 160,
          color: const Color(0xFFECECEF),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white70),
                  child: Column(children: [
                    ChurchSchedule(),
                    const FreshManna(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
