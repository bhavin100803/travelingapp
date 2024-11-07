import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/page/bottomsheet.dart';
import 'package:travelbuddy/widget/auth.dart';
import 'package:travelbuddy/widget/login_info.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
//
// class _LoginState extends State<Login> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         foregroundColor: Colors.white,
//         title: Text(
//           "Login To App",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         color: Colors.grey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // SignInButton(Buttons.GoogleDark, onPressed: () async {
//             //   await signInWithGoogle();
//             //   final User? currentUser = await _auth.currentUser;
//             //   LocalDataSaver.saveLoginData(true);
//             //   LocalDataSaver.saveImg(currentUser!.photoURL.toString());
//             //   LocalDataSaver.saveMail(currentUser.email.toString());
//             //   LocalDataSaver.saveName(currentUser.displayName.toString());
//             //   LocalDataSaver.saveSync(false);
//             //   firedatabase().getAllStoredNotes();
//             //   Navigator.pushReplacement(
//             //       context, MaterialPageRoute(builder: (_) => HomePage()));
//             // }),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await signInWithGoogle();
//                   final User? currentUser = await _auth.currentUser;
//                   LocalDataSaver.saveLoginData(true);
//                   LocalDataSaver.saveImg(currentUser!.photoURL.toString());
//                   LocalDataSaver.saveMail(currentUser.email.toString());
//                   LocalDataSaver.saveName(currentUser.displayName.toString());
//                   LocalDataSaver.saveSync(false);
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => BottomNavBar(index: 0)));
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                         return Colors.green; // Background color when pressed
//                       }
//                       return Colors.white; // Default background color
//                     },
//                   ),
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                 ),
//                 child: Center(
//                   child: Row(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Image.asset(
//                           "assets/google.png",
//                           height: 30,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text(
//                         "Sign In With Google",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login4.jpg"), // Background image
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned text "Fly with us"
          Positioned(
            top: 100,
            left: 90,
            child: Text(
              "Fly with us",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Colors.grey, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(Rect.fromLTWH(0, 0, 300, 70)),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 40,
            child: Text(
              "keep calm and go around the\n                   world",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50,),
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await signInWithGoogle();
                    final User? currentUser = await _auth.currentUser;
                    LocalDataSaver.saveLoginData(true);
                    LocalDataSaver.saveImg(currentUser!.photoURL.toString());
                    LocalDataSaver.saveMail(currentUser.email.toString());
                    LocalDataSaver.saveName(currentUser.displayName.toString());
                    LocalDataSaver.saveSync(false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BottomNavBar(index: 0)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        height: 25,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    //   Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage("assets/login4.jpg"), // Background image
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ),
    //       Center(
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.white.withOpacity(0.9), // Semi-transparent background for the card
    //             borderRadius: BorderRadius.circular(20),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.black26,
    //                 blurRadius: 10,
    //                 offset: Offset(0, 4),
    //               ),
    //             ],
    //           ),
    //           padding: EdgeInsets.all(30.0),
    //           margin: EdgeInsets.symmetric(horizontal: 20.0),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                 "Welcome",
    //                 style: TextStyle(
    //                   fontSize: 24,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               SizedBox(height: 10),
    //               Text(
    //                 "Please sign in to continue",
    //                 style: TextStyle(
    //                   fontSize: 16,
    //                   color: Colors.black54,
    //                 ),
    //               ),
    //               SizedBox(height: 30),
    //               ElevatedButton(
    //                 onPressed: () async {
    //                   await signInWithGoogle();
    //                   final User? currentUser = await _auth.currentUser;
    //                   LocalDataSaver.saveLoginData(true);
    //                   LocalDataSaver.saveImg(currentUser!.photoURL.toString());
    //                   LocalDataSaver.saveMail(currentUser.email.toString());
    //                   LocalDataSaver.saveName(currentUser.displayName.toString());
    //                   LocalDataSaver.saveSync(false);
    //                   Navigator.pushReplacement(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (_) => BottomNavBar(index: 0)));
    //                 },
    //                 style: ButtonStyle(
    //                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
    //                         (Set<MaterialState> states) {
    //                       if (states.contains(MaterialState.pressed)) {
    //                         return Colors.green; // Background color when pressed
    //                       }
    //                       return Colors.blue.withOpacity(0.5); // Default background color
    //                     },
    //                   ),
    //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //                   padding: MaterialStateProperty.all<EdgeInsets>(
    //                     EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    //                   ),
    //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(30.0),
    //                     ),
    //                   ),
    //                 ),
    //                 child: Center(
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(left: 10),
    //                         child: Image.asset(
    //                           "assets/google.png",
    //                           height: 30,
    //                         ),
    //                       ),
    //                       SizedBox(width: 20),
    //                       Text(
    //                         "Sign In With Google",
    //                         style: TextStyle(
    //                           fontSize: 18,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: 100, // Adjust this value to change vertical position
    //         left: 90, // Adjust this value to change horizontal position
    //         child: Text(
    //           "Fly with us",
    //           style: TextStyle(
    //             fontSize: 40,
    //             fontWeight: FontWeight.bold,
    //             // Use a shader to create a gradient effect
    //             foreground: Paint()
    //               ..shader = LinearGradient(
    //                 colors: [Colors.grey, Colors.black], // Two colors for the gradient
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //               ).createShader(Rect.fromLTWH(0, 0, 300, 70)), // Adjust the rect size
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: 160,
    //         left: 30,
    //         child: Expanded(
    //           child: Text(
    //             "keep calm and go\n around the world",
    //             style: TextStyle(
    //               fontSize: 22,
    //               fontWeight: FontWeight.bold,
    //               foreground: Paint()
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    //   Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/login4.jpg"), // Replace with your background image
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     child: Center(
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white.withOpacity(0.9), // Semi-transparent background
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black26,
    //               blurRadius: 10,
    //               offset: Offset(0, 4),
    //             ),
    //           ],
    //         ),
    //         padding:  EdgeInsets.all(30.0),
    //         margin:  EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               "Welcome",
    //               style: TextStyle(
    //                 fontSize: 24,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             SizedBox(height: 10),
    //             Text(
    //               "Please sign in to continue",
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 color: Colors.black54,
    //               ),
    //             ),
    //             SizedBox(height: 30),
    //             ElevatedButton(
    //               onPressed: () async {
    //                 await signInWithGoogle();
    //                 final User? currentUser = await _auth.currentUser;
    //                 LocalDataSaver.saveLoginData(true);
    //                 LocalDataSaver.saveImg(currentUser!.photoURL.toString());
    //                 LocalDataSaver.saveMail(currentUser.email.toString());
    //                 LocalDataSaver.saveName(currentUser.displayName.toString());
    //                 LocalDataSaver.saveSync(false);
    //                 Navigator.pushReplacement(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (_) => BottomNavBar(index: 0)));
    //               },
    //               style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.resolveWith<Color>(
    //                       (Set<MaterialState> states) {
    //                     if (states.contains(MaterialState.pressed)) {
    //                       return Colors.green; // Background color when pressed
    //                     }
    //                     return Colors.blue.withOpacity(0.5); // Default background color
    //                   },
    //                 ),
    //                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //                 padding: MaterialStateProperty.all<EdgeInsets>(
    //                   EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    //                 ),
    //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                   RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(30.0),
    //                   ),
    //                 ),
    //               ),
    //               child: Center(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.only(left: 10),
    //                       child: Image.asset(
    //                         "assets/google.png",
    //                         height: 30,
    //                       ),
    //                     ),
    //                     SizedBox(width: 20),
    //                     Text(
    //                       "Sign In With Google",
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

// class _LoginState extends State<Login> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: Text(
//       //     "Login To App",
//       //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//       //   ),
//       //   backgroundColor: Colors.white,
//       //   elevation: 1, // Subtle shadow for the app bar
//       // ),
//       body: Container(
//         color: Colors.grey[200], // Light grey background for the body
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white, // White background for the login card
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(30.0),
//             margin: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Welcome",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Please sign in to continue",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await signInWithGoogle();
//                     final User? currentUser = await _auth.currentUser;
//                     LocalDataSaver.saveLoginData(true);
//                     LocalDataSaver.saveImg(currentUser!.photoURL.toString());
//                     LocalDataSaver.saveMail(currentUser.email.toString());
//                     LocalDataSaver.saveName(currentUser.displayName.toString());
//                     LocalDataSaver.saveSync(false);
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => BottomNavBar(index: 0)));
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           return Colors.green; // Background color when pressed
//                         }
//                         return Colors.blue; // Default background color
//                       },
//                     ),
//                     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                     padding: MaterialStateProperty.all<EdgeInsets>(
//                       EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                     ),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Image.asset(
//                             "assets/google.png",
//                             height: 30,
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Text(
//                           "Sign In With Google",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
