import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Showticket extends StatefulWidget {
  const Showticket({super.key});

  @override
  State<Showticket> createState() => _ShowticketState();
}

class _ShowticketState extends State<Showticket> {

  Future<void> deleteBooking(String bookingId) async {
    try {
      await FirebaseFirestore.instance
          .collection('booking')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("booking")
          .doc(bookingId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking deleted successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete booking: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('booking')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("booking")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> bookings = snapshot.data!.docs;

          return ListView(
            children: bookings.map((doc) {
              // Access each field in the booking document
              final String firstName = doc['first'] ?? '';
              // final String secondName = doc['second'] ?? '';
              final String from = doc['from'] ?? '';
              final String to = doc['to'] ?? '';
              final String count = doc['count'] ?? '';
              final String starttime = doc['Starttime'] ?? '';
              final String endtime = doc['endtime'] ?? '';
              final String bookingId = doc.id; // Document ID as booking ID

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Booking ID: $bookingId",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                              IconButton(onPressed: (){
                                deleteBooking(bookingId);
                              }, icon: Icon(Icons.delete))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text("First Name: $firstName",
                            style: TextStyle(fontSize: 16)),
                        // Text("Last Name: $secondName",
                        //     style: TextStyle(fontSize: 16)),
                        Text("From: $from", style: TextStyle(fontSize: 16)),
                        Text("To: $to", style: TextStyle(fontSize: 16)),
                        Text("Member: $count", style: TextStyle(fontSize: 16)),
                        Text("Start Time: $starttime", style: TextStyle(fontSize: 16)),
                        Text("End Time: $endtime", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
