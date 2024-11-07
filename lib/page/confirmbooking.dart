import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:travelbuddy/page/bottomsheet.dart';

class Confirmbooking extends StatefulWidget {
  final String firstName;
  // final String secondName;
  final List<String> passengerNames;
  final int count;
  final price;
  final String from;
  final String to;
  final String bookingId;
  final starttime;
  final endtime;
  Confirmbooking(
      {super.key,
      required this.firstName,
      // required this.secondName,
      required this.passengerNames,
      required this.count,
      required this.price,
      required this.from,
      required this.to,
      required this.bookingId,
      required this.starttime,
        required this.endtime
      });

  @override
  State<Confirmbooking> createState() => _ConfirmbookingState();
}

// class _ConfirmbookingState extends State<Confirmbooking> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 7), () {
//       Navigator.pop(context);
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => BottomNavBar(index: 0)));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(automaticallyImplyLeading: false, title: Text('')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Lottie.asset(
//                 'assets/2.json',
//                 width: 300,
//                 height: 300,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "${widget.firstName}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   // Text("${widget.secondName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                   Text(
//                     "Passenger Names: ${widget.passengerNames}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "From: ${widget.from}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "To: ${widget.to}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Price: ${widget.price}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Count: ${widget.count}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Booking ID: ${widget.bookingId}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Start Time: ${widget.starttime}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "End Time: ${widget.endtime}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _ConfirmbookingState extends State<Confirmbooking> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();

    // Speak the confirmation message
    _speakConfirmation();

    // Navigate after a delay
    Timer(Duration(seconds: 7), () {
      Navigator.pop(context);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BottomNavBar(index: 0)));
    });
  }

  Future<void> _speakConfirmation() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);  // Adjust the speech rate if needed
    await flutterTts.speak("Your ticket is confirmed.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                'assets/2.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.firstName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Passenger Names: ${widget.passengerNames}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "From: ${widget.from}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "To: ${widget.to}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Price: ${widget.price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Count: ${widget.count}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Booking ID: ${widget.bookingId}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Start Time: ${widget.starttime}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "End Time: ${widget.endtime}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();  // Stop TTS when the widget is disposed
    super.dispose();
  }
}




