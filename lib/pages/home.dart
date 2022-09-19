import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  final String username;
  Home({super.key, required this.username});
  var banners = [
    Image.asset(
      'assets/banner1.png',
    ),
    Image.asset(
      'assets/banner2.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + this.username),
      ),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Image.asset(
            'assets/logo.png',
            width: 100,
          ),
          CarouselSlider(
            items: banners,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
          ),
          const Text(
            "Netflix is a streaming service that offers a wide variety of award-winning TV programmes, films, anime, documentaries and more on thousands of internet-connected devices.\n\nYou can watch as much as you want, whenever you want, without a single advert – all for one low monthly price. There's always something new to discover, and new TV programmes and films are added every week!",
            style: TextStyle(fontSize: 18.0),
          ),
        ]),
      )),
    );
  }
}
