// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:travelbuddy/modal/destination_model.dart';
//
// class DestinationCarousel extends StatefulWidget {
//   const DestinationCarousel({super.key});
//
//   @override
//   State<DestinationCarousel> createState() => _DestinationCarouselState();
// }
//
// class _DestinationCarouselState extends State<DestinationCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "Top Destinations",
//                 style: TextStyle(
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.5),
//               ),
//               GestureDetector(
//                 onTap: () => print("See All"),
//                 child: Text(
//                   "See All",
//                   style: TextStyle(
//                       color: Colors.blue.shade300,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 1.0),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           height: 300,
//           color: Colors.blue,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: destinations.length,
//             itemBuilder: (BuildContext Context, int index) {
//               Destination destination = destinations[index];
//               return Container(
//                 margin: EdgeInsets.all(10.0),
//                 width: 210,
//                 color: Colors.red,
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: <Widget>[
//                     Positioned(
//                       bottom: 15.0,
//                       child: Container(
//                         height: 120.0,
//                         width: 200.0,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.0)),
//                         child: Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 "${destination.activities.length} activities",
//                                 style: TextStyle(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.w500,
//                                     letterSpacing: 1.1),
//                               ),
//                               Text(
//                                 destination.description,
//                                 style:
//                                     TextStyle(color: Colors.grey, fontSize: 12),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0.0, 2.0),
//                                 blurRadius: 6.0)
//                           ]),
//                       child: Stack(
//                         children: <Widget>[
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: Image(
//                               height: 180.0,
//                               width: 180.0,
//                               image: AssetImage(destination.imageUrl),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 destination.city,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 24.0,
//                                     fontWeight: FontWeight.w600,
//                                     letterSpacing: 1.1),
//                               ),
//                               Text(destination.country,style: TextStyle(color: Colors.white),)
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:travelbuddy/modal/destination_model.dart';
import 'package:travelbuddy/page/destination_screen.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
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
                'Top Destinations',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              // GestureDetector(
              //   onTap: () => print('See All'),
              //   child: Text(
              //     'See All',
              //     style: TextStyle(
              //       color: Colors.blue.shade500,
              //       fontSize: 16.0,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: 1.0,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return
                GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(destination: destination)
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${destination.activities.length} activities',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  destination.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      // Icon(
                                      //   FontAwesomeIcons.locationArrow,
                                      //   size: 10.0,
                                      //   color: Colors.white,
                                      // ),
                                      // SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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