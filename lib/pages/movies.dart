import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/pages/detail.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});
  List<Movie> movies = [
    Movie(
        synopsis:
            "While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.",
        title: "Enola Holmes",
        rating: 4.4,
        poster: 'assets/poster1.jpg',
        releaseYear: 2020),
    Movie(
        synopsis:
            "When the CIA's top asset -- his identity known to no one -- uncovers agency secrets, he triggers a global hunt by assassins set loose by his ex-colleague.",
        title: "The Gray Man",
        rating: 4.1,
        poster: 'assets/poster2.jpg',
        releaseYear: 2022),
    Movie(
        synopsis:
            "A woman's quiet life on an American farm takes a terrifying turn when the remains of her estranged mother arrive from Korea.",
        title: "Umma",
        rating: 3.0,
        poster: 'assets/poster3.jpg',
        releaseYear: 2022),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/logo.png',
          width: 100,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    movies[index].poster,
                    width: 200,
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(
                    movies[index].title,
                    style: const TextStyle(fontSize: 25),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Detail(curr: movies[index]);
                        }));
                      },
                      child: const Text('Detail')),
                  const Padding(padding: EdgeInsets.all(30)),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}

class Movie {
  String title;
  String synopsis;
  double rating;
  int releaseYear;
  String poster;
  List<String> comments = ['Good Movie'];
  Movie({
    required this.synopsis,
    required this.title,
    required this.poster,
    required this.rating,
    required this.releaseYear,
  });
}
