import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// home: AnimatedHideAppbarAndBottomBar(Name()), // Call this in main.dart

class Exercise {
  String name;
  Exercise({@required name}) {
    this.name = name;
  }
}

class Name {
  String name = "GRASSROOT WORKOUT";
}

class AnimatedHideAppbarAndBottomBar extends StatefulWidget {
  Name _grassroot = Name();

  AnimatedHideAppbarAndBottomBar(this._grassroot);

  @override
  _AnimatedHideAppbarAndBottomBarState createState() =>
      _AnimatedHideAppbarAndBottomBarState();
}

class _AnimatedHideAppbarAndBottomBarState
    extends State<AnimatedHideAppbarAndBottomBar> {

  final List<Exercise> exercises = [
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
    Exercise(name: "Push Ups"),
    Exercise(name: "Bench press"),
    Exercise(name: "Pull ups"),
    Exercise(name: "Press ups"),
    Exercise(name: "Crunches"),
    Exercise(name: "Sit ups"),
    Exercise(name: "BIceps curl"),
    Exercise(name: "Something else"),
  ];

  ScrollController _hideButtonController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      print("listener");
      if (_hideButtonController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _isVisible
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              elevation: 12,
              onPressed: () {
                print('Press center float button');
              },
            )
          : null,
      bottomNavigationBar: 
      AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isVisible ? 60 : 0.0,
        child: 
        BottomAppBar(
          elevation: 8,
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(
            height: 60,
            child: Row(
              children: <Widget>[
                Text("data"),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _hideButtonController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true, // กำหนดว่าจะให้ pin appbar ไว้บางส่วนไหม หรือ ให้หายไปหมด
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget._grassroot.name),
              // title: Text('GRASSROOT ENGINEER'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              buildSliverListItem,
              childCount: exercises.length),
          ),
        ],
      ),
    );
  }

  Widget buildSliverListItem(BuildContext context, int index) {
    return Center(
      child: ListTile(
        onTap: () => print(exercises[index].name),
        title: Text(exercises[index].name),
      ),
    );
  }
}
