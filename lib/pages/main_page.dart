import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/pages/home.dart';
import 'package:qualif_flutter/pages/logout.dart';
import 'package:qualif_flutter/pages/movies.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      Home(
        username: widget.username,
      ),
      MoviesPage(),
      const LogoutPage()
    ];
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: selected,
        onDestinationSelected: (index) => setState(() {
          selected = index;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            selectedIcon: Icon(Icons.home_filled),
          ),
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            label: "Movies",
            selectedIcon: Icon(Icons.movie),
          ),
          NavigationDestination(
            icon: Icon(Icons.logout),
            label: "Log Out",
            selectedIcon: Icon(Icons.logout_sharp),
          )
        ],
      ),
    );
  }
}
