import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:travelbuddy/page/login.dart';
import '../colors.dart';
import '../modal/onbording_contant.dart';

//
// class OnboardingScreens extends StatefulWidget {
//   const OnboardingScreens({super.key});
//
//   @override
//   State<OnboardingScreens> createState() => _OnboardingScreensState();
// }
// //
// // class _OnboardingScreensState extends State<OnboardingScreens> {
// //   int currentIndex = 0;
// //
// //   late Timer _timer;
// //   PageController _controller = PageController(
// //     initialPage: 0,
// //   );
// //
// //   @override
// //   void initState() {
// //     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
// //       if (currentIndex <= contents.length) {
// //         currentIndex++;
// //       }
// //       _controller.animateToPage(
// //         currentIndex,
// //         duration: Duration(seconds: 1),
// //         curve: Curves.easeIn,
// //       );
// //       super.initState();
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var height = MediaQuery.of(context).size.height;
// //     var width = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SingleChildScrollView(
// //         child: Container(
// //           width: width,
// //           height: height,
// //           child: Column(
// //             children: [
// //               Container(
// //                 height: height,
// //                 child: PageView.builder(
// //                   itemCount: contents.length,
// //                   controller: _controller,
// //                   onPageChanged: (int index) {
// //                     setState(() {
// //                       currentIndex = index;
// //                     });
// //                   },
// //                   itemBuilder: (context, index) {
// //                     return Container(
// //                       color: color.fourcolor,
// //                        height: height,
// //                        width: width,
// //                       child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Container(
// //                                 child: Image.asset(contents[index].image,fit: BoxFit.fill,),
// //                               height: height / 1.11,
// //                             ),
// //                             Container(
// //                               padding: EdgeInsets.all(10),
// //                               // height: 200,
// //                                color: color.fourcolor,
// //                               child: Column(
// //                                 children: [
// //                                    // SizedBox(height: 40,),
// //                                   Row(
// //                                       mainAxisAlignment:
// //                                       MainAxisAlignment.center,
// //                                       children: _buildDots(),
// //                                   ),
// //                                   // SizedBox(height: 20,),
// //                                   Container(
// //                                     child: currentIndex == contents.length - 1
// //                                         ? Center(
// //                                         child: ElevatedButton(
// //                                             style: ElevatedButton.styleFrom(
// //                                                 backgroundColor:
// //                                                 color.thirdcolor),
// //                                             onPressed: () {
// //                                               Navigator.pushReplacement(
// //                                                   context,
// //                                                   MaterialPageRoute(
// //                                                       builder: (context) =>
// //                                                           Login()));
// //                                             },
// //                                             child: Text(
// //                                               "Wel Come",
// //                                               style: TextStyle(
// //                                                   color: Colors.white),
// //                                             )))
// //                                         : Row(
// //                                       mainAxisAlignment:
// //                                       MainAxisAlignment.spaceBetween,
// //                                       children: [
// //                                         GestureDetector(
// //                                           onTap: () {
// //                                             setState(() {
// //                                               Navigator.pushReplacement(
// //                                                 context,
// //                                                 MaterialPageRoute(
// //                                                   builder: (_) =>
// //                                                       Login(),
// //                                                 ),
// //                                               );
// //                                             });
// //                                           },
// //                                           child: Text(
// //                                             "Skip",
// //                                             textAlign: TextAlign.center,
// //                                             style: GoogleFonts.inter(
// //                                               textStyle: TextStyle(
// //                                                   fontSize: 13,
// //                                                   fontWeight:
// //                                                   FontWeight.w500,
// //                                                   color: Colors.white),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         ElevatedButton(
// //                                           onPressed: () {
// //                                             _controller.nextPage(
// //                                                 duration: Duration(
// //                                                     milliseconds: 300),
// //                                                 curve:
// //                                                 Curves.easeOutSine);
// //                                           },
// //                                           child: Text(
// //                                             ">",
// //                                             style: TextStyle(
// //                                                 color: Colors.white,
// //                                                 fontSize: 20),
// //                                           ),
// //                                           style: ElevatedButton.styleFrom(
// //                                               backgroundColor:
// //                                               color.thirdcolor
// //                                             // maximumSize:
// //                                             //     Size.fromWidth(width * 0.115),
// //                                           ),
// //                                           // text: ">",
// //                                           // getWidth: width * 0.115,
// //                                           // OnTap: () {
// //                                           //
// //                                           // },
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ]),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   List<Widget> _buildDots() {
// //     return List.generate(
// //       contents.length,
// //           (index) => Padding(
// //         padding: const EdgeInsets.all(5),
// //         child: Container(
// //           width: currentIndex == index ? 17.0 : 8,
// //           height: 4,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(21),
// //             color: currentIndex == index ? color.thirdcolor : Colors.grey,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//

// real code

// class _OnboardingScreensState extends State<OnboardingScreens> {
//   int currentIndex = 0;
//   late Timer _timer;
//   PageController _controller = PageController(
//     initialPage: 0,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (currentIndex < contents.length - 1) {
//         currentIndex++;
//         _controller.animateToPage(
//           currentIndex,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeIn,
//         );
//       } else {
//         timer.cancel();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: width,
//         height: height,
//         child: Stack(
//           children: [
//             PageView.builder(
//               itemCount: contents.length,
//               controller: _controller,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: color.fourcolor,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Image.asset(
//                           contents[index].image,
//                           fit: BoxFit.cover,
//                           width: width,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//             // This Container holds the buttons and the indicators (dots) above the image
//             Positioned(
//               bottom: 20,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: _buildDots(),
//                     ),
//                     SizedBox(height: 20),
//                     currentIndex == contents.length - 1
//                         ? ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: color.thirdcolor,
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Login(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Wel Come",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                         : Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => Login(),
//                                 ),
//                               );
//                             });
//                           },
//                           child: Text(
//                             "Skip",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _controller.nextPage(
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeOutSine,
//                             );
//                           },
//                           child: Text(
//                             ">",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: color.thirdcolor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildDots() {
//     return List.generate(
//       contents.length,
//           (index) => Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           width: currentIndex == index ? 17.0 : 8,
//           height: 4,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(21),
//             color: currentIndex == index ? color.thirdcolor : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _OnboardingScreensState extends State<OnboardingScreens> {
//   int currentIndex = 0;
//   late Timer _timer;
//   PageController _controller = PageController(
//     initialPage: 0,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (currentIndex < contents.length - 1) {
//         currentIndex++;
//         _controller.animateToPage(
//           currentIndex,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeIn,
//         );
//       } else {
//         timer.cancel();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: width,
//         height: height,
//         child: Stack(
//           children: [
//             PageView.builder(
//               itemCount: contents.length,
//               controller: _controller,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: color.fourcolor,
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         contents[index].image,
//                         fit: BoxFit.cover,
//                         width: width,
//                         height: height,
//                       ),
//                       Positioned(
//                         bottom: 150,
//                         left: 20,
//                         right: 20,
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: contents[index].desc,
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.white.withOpacity(0.9),
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               // TextSpan(
//                               //   text: contents[index].desc,
//                               //   style: TextStyle(
//                               //     fontSize: 18,
//                               //     color: Colors.orangeAccent.withOpacity(0.9),
//                               //     fontWeight: FontWeight.bold,
//                               //   ),
//                               // ),
//                               // TextSpan(
//                               //   text: contents[index].desc,
//                               //   style: TextStyle(
//                               //     fontSize: 18,
//                               //     color: Colors.white.withOpacity(0.9),
//                               //     fontWeight: FontWeight.w400,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//             // This Container holds the buttons and the indicators (dots) above the image
//             Positioned(
//               bottom: 20,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: _buildDots(),
//                     ),
//                     SizedBox(height: 20),
//                     currentIndex == contents.length - 1
//                         ? ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: color.thirdcolor,
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Login(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Welcome",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                         : Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => Login(),
//                                 ),
//                               );
//                             });
//                           },
//                           child: Text(
//                             "Skip",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.inter(
//                               textStyle: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _controller.nextPage(
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeOutSine,
//                             );
//                           },
//                           child: Text(
//                             ">",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: color.thirdcolor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildDots() {
//     return List.generate(
//       contents.length,
//           (index) => Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           width: currentIndex == index ? 17.0 : 8,
//           height: 4,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(21),
//             color: currentIndex == index ? color.thirdcolor : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

// class _OnboardingScreensState extends State<OnboardingScreens> {
//   int currentIndex = 0;
//   late Timer _timer;
//   final PageController _controller = PageController(initialPage: 0);
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (currentIndex < contents.length - 1) {
//         setState(() {
//           currentIndex++;
//           _controller.animateToPage(
//             currentIndex,
//             duration: Duration(seconds: 1),
//             curve: Curves.easeIn,
//           );
//         });
//       } else {
//         _timer.cancel();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: width,
//         height: height,
//         child: PageView.builder(
//           itemCount: contents.length,
//           controller: _controller,
//           onPageChanged: (int index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           itemBuilder: (context, index) {
//             return Stack(
//               fit: StackFit.expand,
//               children: [
//                 // Fullscreen background image
//                 Image.asset(
//                   contents[index].image,
//                   fit: BoxFit.cover,
//                 ),
//                 // Dark overlay for readability
//                 Container(
//                   color: Colors.black.withOpacity(0.4),
//                 ),
//                 // Title at the top
//                 Positioned(
//                   top: 80,
//                   left: 20,
//                   right: 20,
//                   child: Text(
//                     contents[index].title,
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Bottom section with description, dots, and buttons
//                 Positioned(
//                   bottom: 40,
//                   left: 20,
//                   right: 20,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: Text(
//                           contents[index].desc,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: _buildDots(),
//                       ),
//                       SizedBox(height: 20),
//                       currentIndex == contents.length - 1
//                           ? ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: color.thirdcolor,
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                         child: Text(
//                           "Get Started",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                           : Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => Login()),
//                               );
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.all(16.0),
//                               child: Text(
//                                 "Skip",
//                                 style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               _controller.nextPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeOutSine,
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: color.thirdcolor,
//                             ),
//                             child: Text(
//                               ">",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildDots() {
//     return List.generate(
//       contents.length,
//           (index) => Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           width: currentIndex == index ? 17.0 : 8,
//           height: 4,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(21),
//             color: currentIndex == index ? color.thirdcolor : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }

class _OnboardingScreensState extends State<OnboardingScreens> {
  int currentIndex = 0;
  late Timer _timer;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentIndex < contents.length - 1) {
        setState(() {
          currentIndex++;
          _controller.animateToPage(
            currentIndex,
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
          );
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        child: PageView.builder(
          itemCount: contents.length,
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // Fullscreen background image
                Image.asset(
                  contents[index].image,
                  fit: BoxFit.cover,
                ),
                // Bottom overlay with content
                Positioned(
                  bottom: 10,
                  left: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          contents[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildDots(),
                        ),
                        SizedBox(height: 20),
                        currentIndex == contents.length - 1
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: color.thirdcolor,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Skip",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _controller.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOutSine,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: color.thirdcolor,
                                        shape: CircleBorder(),
                                        minimumSize: Size(45, 45)),
                                    child: Text(
                                      ">",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    return List.generate(
      contents.length,
      (index) => Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: currentIndex == index ? 17.0 : 8,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: currentIndex == index ? color.thirdcolor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
