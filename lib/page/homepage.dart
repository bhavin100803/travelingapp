import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelbuddy/colors.dart';
import 'package:travelbuddy/page/famousplace.dart';
import 'package:travelbuddy/page/searchpage.dart';
import 'package:travelbuddy/widget/destination_carousel.dart';
import 'package:travelbuddy/widget/hotelcarousel.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;
  int _currentTab = 1;


  List<IconData> _icons = [
    FontAwesomeIcons.car,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedindex = index;
        });
        print(_selectedindex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedindex == index
                ? Colors.blue.shade50
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedindex == index
              ? color.my_Primariycolor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "What Would You Like to find?",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Searchpage()));
                          },
                          child: Icon(
                            Icons.search,
                            size: 35,
                            color: Colors.grey,
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            Hotelcarousel(),
            SizedBox(
              height: 20,
            ),
            Famousplace()

          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //           onTap: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (_)=>Homepage()));
      //           },
      //           child: Icon(Icons.home)),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.white,
      //       icon: GestureDetector(
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (_)=>Searchpage()));
      //         },
      //           child: Icon(Icons.search)),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (_)=>Communitypage()));
      //         },
      //           child: Icon(Icons.keyboard_command_key)),
      //       label: 'Communication',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //           onTap: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (_)=>Settingpage()));
      //           },
      //           child: Icon(Icons.settings)),
      //       label: 'Setting',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.white,
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedindex,
      //    selectedItemColor: Colors.grey,
      //    unselectedItemColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
