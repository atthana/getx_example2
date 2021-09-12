import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideAppbarOrBottomBar extends StatefulWidget {
  @override
  _HideAppbarOrBottomBarState createState() => _HideAppbarOrBottomBarState();
}

class _HideAppbarOrBottomBarState extends State<HideAppbarOrBottomBar> with SingleTickerProviderStateMixin {
  // Explicit

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
      // controller: _scrollBottomBarController,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(index.toString()),
              subtitle: Text('GRASSROOT ENGINEER No. $index',),
            ),
          );
        }),
    Text('Index 1: Business', style: optionStyle,),
    Text('Index 2: School', style: optionStyle,),
  ];

  //============ setup scrolling variables =================
  bool _showAppbar = true; //this is to show app bar
  ScrollController _scrollBottomBarController = new ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  double _bottomBarOffset = 0;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() { 
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void showBottomBar() {
  setState(() {
    _show = true;
  });
}

void hideBottomBar() {
  setState(() {
    _show = false;
  });
}

void myScroll() async {
  _scrollBottomBarController.addListener(() {
    if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        hideBottomBar();
      }
    }
    if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
        showBottomBar();
      }
    }
  });
}

//======================== end ==============================

  // Method
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: _showAppbar?AppBar(
        title: const Text('Hide, show when scrolling sample'),
        ): PreferredSize(
        child: Container(),
        preferredSize: Size(0.0, 0.0),
      ),

      body: Center(
        // child: _widgetOptions.elementAt(_selectedIndex),
        child: ListView.builder(
          controller: _scrollBottomBarController,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(index.toString()),
                  subtitle: Text('GRASSROOT ENGINEER No. $index',),
                ),
              );
            }
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
