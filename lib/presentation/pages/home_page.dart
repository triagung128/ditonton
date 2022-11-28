import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movies/movie_list_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: 'Movies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.live_tv_outlined),
      label: 'TV Series',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      label: 'About',
    ),
  ];

  final List<Widget> _listWidget = [
    MovieListPage(),
    TvSeriesListPage(),
    AboutPage(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}