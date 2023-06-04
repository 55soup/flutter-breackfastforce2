import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('일기'),
            icon: Icon(Icons.drive_file_rename_outline),
          ),
          BottomNavigationBarItem(
            title: Text('레시피'),
            icon: Icon(Icons.rice_bowl_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('아침구독'),
            icon: Icon(Icons.restaurant_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('정보'),
            icon: Icon(Icons.book_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('통계'),
            icon: Icon(Icons.trending_up_outlined),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [
    Text(
      'Favorites',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'Music',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'Places',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
  ];
}