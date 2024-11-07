import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/modal/destination_model.dart';
import 'package:travelbuddy/page/detailpage.dart';

class Famousplace extends StatefulWidget {
  const Famousplace({super.key});

  @override
  State<Famousplace> createState() => _FamousplaceState();
}

// class _FamousplaceState extends State<Famousplace> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Famous Place',
//                 style: TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.5,
//                 ),
//               ),
//               // GestureDetector(
//               //   onTap: () => print('See All'),
//               //   child: Text(
//               //     'See All',
//               //     style: TextStyle(
//               //       color: Colors.blue.shade500,
//               //       fontSize: 16.0,
//               //       fontWeight: FontWeight.w600,
//               //       letterSpacing: 1.0,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         Container(
//           height: 300.0,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: destinations.length,
//             itemBuilder: (BuildContext context, int index) {
//               Destination destination = destinations[index];
//               return
//                 GestureDetector(
//                   onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (_) => Detailpage(destination: destination,)
//                     ),
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.all(10.0),
//                     width: 210.0,
//                     child: Stack(
//                       alignment: Alignment.topCenter,
//                       children: <Widget>[
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0.0, 2.0),
//                                 blurRadius: 6.0,
//                               ),
//                             ],
//                           ),
//                           child: Stack(
//                             children: <Widget>[
//                               Hero(
//                                 tag: destination.imageUrl,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   child: Image(
//                                     height: 180.0,
//                                     width: 400.0,
//                                     image: AssetImage(destination.imageUrl),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               // Positioned(
//                               //   left: 10.0,
//                               //   bottom: 10.0,
//                               //   child: Column(
//                               //     crossAxisAlignment: CrossAxisAlignment.start,
//                               //     children: <Widget>[
//                               //       Text(
//                               //         destination.city,
//                               //         style: TextStyle(
//                               //           color: Colors.white,
//                               //           fontSize: 24.0,
//                               //           fontWeight: FontWeight.w600,
//                               //           letterSpacing: 1.2,
//                               //         ),
//                               //       ),
//                               //       Row(
//                               //         children: <Widget>[
//                               //           // Icon(
//                               //           //   FontAwesomeIcons.locationArrow,
//                               //           //   size: 10.0,
//                               //           //   color: Colors.white,
//                               //           // ),
//                               //           // SizedBox(width: 5.0),
//                               //           Text(
//                               //             destination.country,
//                               //             style: TextStyle(
//                               //               color: Colors.white,
//                               //             ),
//                               //           ),
//                               //         ],
//                               //       ),
//                               //     ],
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }


class _FamousplaceState extends State<Famousplace> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Famous Place',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Detailpage(destination: destination),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 400.0,
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
