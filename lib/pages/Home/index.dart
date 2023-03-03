import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hope/pages/Me.dart';
import 'package:hope/utils/ConstVal.dart';

import '../Search.dart';
import 'Page1.dart';
import 'Page2.dart';
export '';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("page3");
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Page4");
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Page5");
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  double stateHeight = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    Search(),
    // Page3(),
    Page4(),
    Me(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    stateHeight = MediaQueryData.fromWindow(window).padding.top;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: const TextStyle(color: Colors.white, fontSize: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: double.infinity),
            child: Container(
              padding: EdgeInsets.only(top: stateHeight),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(15, 22, 33, 1),
              ),
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(mainBgColor),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color(mainColor),
        onTap: _onItemTapped,
      ),
    );
  }
}
