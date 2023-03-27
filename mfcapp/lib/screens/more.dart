import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:mfcapp/providers/auth.dart';
import 'package:mfcapp/screens/auth/login.dart';
import 'package:mfcapp/screens/index.dart';
import 'package:provider/provider.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    auth.isUserLogedin();
    return WillPopScope(
      onWillPop: () async {
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>IndexPage()));
         return true;
      },
      child: Scaffold(
      // backgroundColor: const Color(0xFFDFDDCE),
      backgroundColor: const Color(0xFFFFFFFF),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 8),
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'More',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    // Divider(
                    //   thickness: 2,
                    // ),
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: Colors.grey.shade100
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 95.0),
              child: Container(
                decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                ),
                color: Colors.white
              ),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height - 60,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(Icons.notifications_outlined),
                            Badge(
                              badgeAnimation: BadgeAnimation.rotation(
                                  toAnimate: true,
                                  animationDuration: Duration(seconds: 3)),
                              badgeContent: Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'Notifications',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(Icons.wb_sunny_outlined),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Verse of the day',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(Icons.info_outline_rounded),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'About',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(Icons.share),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Share',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(Icons.settings),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Settings',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12),
                        child: TextButton(
                          onPressed: () => auth.isLogedin
                              ? auth.logout(context)
                              : Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginPage(),
                                  ),
                                ),
                          child: Row(
                            children: [
                              Icon(Icons.login_rounded),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  auth.isLogedin ? 'Logout' : 'Login',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 400,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToScreen2(BuildContext context) =>
    Navigator.pushReplacementNamed(context, "screen2");
}
