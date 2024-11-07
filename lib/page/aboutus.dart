import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/colors.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

// class _AboutusState extends State<Aboutus> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.width / 1,
//                 width: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                     // borderRadius: BorderRadius.circular(10.0),
//                     boxShadow: const [
//                       BoxShadow(
//                           color: color.my_Primariycolor,
//                           offset: Offset(0.0, 2.0),
//                           blurRadius: 3.0)
//                     ]),
//               ),
//               Positioned(
//                 left: 130.0,
//                 bottom: 180.0,
//                 child: Text(
//                   'About App',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 10.0, vertical: 40.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                           size: 30.0,
//                         )),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Column(children: [
//             Stack(
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.width / 1,
//                   width: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(10.0),
//                       boxShadow: const [
//                         BoxShadow(
//                             color: color.thirdcolor,
//                             offset: Offset(0.0, 2.0),
//                             blurRadius: 3.0)
//                       ]),
//                 ),
//                 Positioned(
//                   left: 12.0,
//                   bottom: 300.0,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       'ABOUT US',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Positioned(
//                     left: 15.0,
//                     bottom: 200.0,
//                     child: Expanded(
//                       child: Container(
//                         width: MediaQuery.sizeOf(context).width,
//                         child: Text(
//                           'Travel App is a Social Travel Community and experience  marketplace.',
//                           style: TextStyle(
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Positioned(
//                     left: 15.0,
//                     bottom: 80.0,
//                     child: Container(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Expanded(
//                         child: Text(
//                           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
//                           style: TextStyle(
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Positioned(
//                     left: 15.0,
//                     bottom: 10,
//                     child: Container(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Expanded(
//                         child: Text(
//                           'It is a long established fact that a reader will be distracted by the. ',
//                           style: TextStyle(
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//           Column(children: [
//             Stack(
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.width / 1,
//                   width: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(10.0),
//                       boxShadow: const [
//                         BoxShadow(
//                             color: color.my_Primariycolor,
//                             offset: Offset(0.0, 2.0),
//                             blurRadius: 3.0)
//                       ]),
//                 ),
//
//               ],
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }
// }

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Stack for About App Section
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width, // Use width here
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: color.my_Primariycolor,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 130.0,
                  bottom: 180.0,
                  child: const Text(
                    'About App',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Second Stack for About Us Section
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width, // Correct usage
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: color.thirdcolor,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 12.0,
                  bottom: 300.0,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'ABOUT US',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15.0,
                  bottom: 200.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30, // Responsive width
                    child: const Text(
                      'Travel App is a Social Travel Community and experience marketplace.',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15.0,
                  bottom: 80.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30, // Responsive width
                    child: const Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15.0,
                  bottom: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30, // Responsive width
                    child: const Text(
                      'It is a long established fact that a reader will be distracted by the.',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Third Stack (currently empty but structured for future content)
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width, // Consistent height
                  width: MediaQuery.of(context).size.width, // Consistent width
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: color.my_Primariycolor,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                // Add more content here if needed.
              ],
            ),
          ],
        ),
      ),
    );
  }
}

