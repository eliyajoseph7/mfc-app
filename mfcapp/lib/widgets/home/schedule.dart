import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChurchSchedule extends StatelessWidget {
  ChurchSchedule({super.key});

  final List<String> imgList = [
    'assets/images/schedule/ratiba.png',
    'assets/images/schedule/sunday.png',
    'assets/images/schedule/monday.png',
    'assets/images/schedule/wednesday.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: const [
            // BoxShadow(
            //     color: Colors.grey.shade300,
            //     spreadRadius: 1,
            //     blurRadius: 10,),
          ], borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    itemCount: imgList.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        enlargeFactor: 0.7),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(imgList[index]),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(),
                      );
                    },
                    // items: imgList.map((item) {
                    //   return Builder(
                    //     builder: (BuildContext context,) {
                    //     },
                    //   );
                    // }).toList(),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                left: 5,
                child: Card(
                  elevation: 0,
                  color: Colors.grey.shade400,
                  child: Text(
                    'Ratiba'.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
