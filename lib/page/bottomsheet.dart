import 'package:flutter/material.dart';
import 'package:travelbuddy/page/addpost.dart';
import 'package:travelbuddy/page/communitypage.dart';
import 'package:travelbuddy/page/homepage.dart';
import 'package:travelbuddy/page/profilepage.dart';
import 'package:travelbuddy/page/settingpage.dart';


class BottomNavBar extends StatefulWidget {
  final int index;
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBar> {
  int? _selectedIndex;
  static  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    // Searchpage(),
    Communitypage(),
    Addpost(),
    Settingpage(),
    // ProfileScreen(),
    Profilepage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
         // backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(Icons.keyboard_command_key),
            label: 'Communication',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(Icons.add_circle),
            label: 'Create Post',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex!,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        unselectedFontSize: 10,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
