import 'package:flutter/material.dart';
import 'package:travelbuddy/page/bottomsheet.dart';
import 'package:travelbuddy/page/onbordingscreen.dart';
import 'dart:async';
import 'package:travelbuddy/widget/login_info.dart';

class SplashScreen extends StatefulWidget {
  final String? path;
    SplashScreen({super.key, this.path});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLogIn = false;

  getLoggedInState() async {
    await LocalDataSaver.getLogData().then((value) {
      setState(() {
        isLogIn = value ?? false;
        print(value.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              isLogIn! ? BottomNavBar(index: 0) : OnboardingScreens()));
    });
    // WidgetsBinding.instance.addPostFrameCallback((c)=>openTheBook());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/beach.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // The overlay text
          Positioned(
            bottom: 80,
            // top: 140,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Explore the World with Us ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 30.0,
                      color: Colors.black,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   // bool? isLogIn = false;
//   late AnimationController _controller;
//   late Animation<double> _rotationAnimation;
//
//   // getLoggedInState() async {
//   //   await LocalDataSaver.getLogData().then((value) {
//   //     setState(() {
//   //       isLogIn = value ?? false;
//   //       print(value.toString());
//   //     });
//   //   });
//   // }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _setupAnimations();
//   //   getLoggedInState();
//   //   _checkLoginStatus();
//   //   Timer(Duration(seconds: 5), _navigateToNext);
//   // }
//
//   void _setupAnimations() {
//     _controller = AnimationController(vsync: this, duration: Duration(seconds: 4));
//     _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.1416).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.linear),
//     )..addListener(() {
//       setState(() {});
//     });
//
//     _controller.repeat();
//   }
//
//   // Future<void> _checkLoginStatus() async {
//   //   // Replace with your actual login check logic
//   //   await Future.delayed(Duration(seconds: 5));
//   //   setState(() {
//   //     isLogIn = true; // Example: user is logged in
//   //   });
//   // }
//
//   // void _navigateToNext() {
//   //   Navigator.of(context).pushReplacement(
//   //     MaterialPageRoute(
//   //       builder: (_) => isLogIn! ? BottomNavBar(index: 0) : OnboardingScreens(),
//   //     ),
//   //   );
//   // }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   bool? isLogIn = false;
// //
//   getLoggedInState() async {
//     await LocalDataSaver.getLogData().then((value) {
//       setState(() {
//         isLogIn = value ?? false;
//         print(value.toString());
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getLoggedInState();
//     Timer(Duration(seconds: 10), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (_) =>
//               isLogIn! ? BottomNavBar(index: 0) : OnboardingScreens()));
//     });
//     // WidgetsBinding.instance.addPostFrameCallback((c)=>openTheBook());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/beach.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Rotating Icon
//           // Center(
//           //   child: Transform.rotate(
//           //     angle: _rotationAnimation.value,
//           //     child: Image.asset(
//           //       'assets/airplan.jpg',
//           //       width: 500,
//           //       height: 500,
//           //       // color: Colors.white.withOpacity(0.8),
//           //     ),
//           //   ),
//           // ),
//           // Overlay Text
//           Positioned(
//             bottom: 80,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 'Explore the World with Us',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 10.0,
//                       color: Colors.black,
//                       offset: Offset(3, 3),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   bool? isLogIn = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//
//   getLoggedInState() async {
//     await LocalDataSaver.getLogData().then((value) {
//       setState(() {
//         isLogIn = value ?? false;
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize slide animation controller
//     _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
//     _slideAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//     _controller.forward();
//
//     getLoggedInState();
//
//     Timer(Duration(seconds: 60), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => isLogIn! ? BottomNavBar(index: 0) : OnboardingScreens()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/venice.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 140,
//             left: 0,
//             right: 0,
//             child: SlideTransition(
//               position: _slideAnimation,
//               child: Center(
//                 child: Text(
//                   'Welcome to Travel App',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 30.0,
//                         color: Colors.black,
//                         offset: Offset(10, 10),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





//   Scaffold(
//   body: Container(
//     width: double.infinity,
//     height: double.infinity,
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('assets/saopaulo.jpg'),
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
// );

// openTheBook(){
//   int Bookno = -1;
//   if(widget.path != null){
//     if(widget.path == "/post"){
//       Bookno = 1;
//     }
//     Navigator.push(context, MaterialPageRoute(builder: (_)=>Showpost()));
//   }
// }