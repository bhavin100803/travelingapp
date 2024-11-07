import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/modal/search_modal.dart';
import 'package:travelbuddy/page/confirmbooking.dart';
import 'package:uuid/uuid.dart';

class Booking extends StatefulWidget {
  final startfrom;
  final Tofrom;
  final starttime;
  final endtime;
  final price;

  Booking(
      {super.key,
      this.Tofrom,
      this.startfrom,
      this.starttime,
      this.endtime,
      this.price});

  @override
  State<Booking> createState() => _BookingState();
}

// class _BookingState extends State<Booking> {
//   late List<searchmodal> searchList;
//   int item = 1;
//   TextEditingController firstController = TextEditingController();
//   TextEditingController secondController = TextEditingController();
//   // String? total;
//   var uuid = Uuid().v1();
//
//   Future increment() async {
//     setState(() {
//       item++;
//     });
//   }
//
//   Future decrement() async {
//     setState(() {
//       if (item > 1) {
//         item--;
//       }
//     });
//   }
//
//   String calculateTotalPrice() {
//     return "${(int.parse(widget.price) * item) + 720 + 400}"; // Total price calculation based on item count
//   }
//
//   String generateUniqueId() {
//     return "${int.parse(widget.price) + 720 + 400}";
//   }
//
//   Future<void> uploadbooking() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection("booking").doc(uuid).set({
//       "first": firstController.text,
//       "second": secondController.text,  // added .text to retrieve the input text
//       "count": item.toString(),
//       "price" : widget.price.toString(),
//       "Form": widget.startfrom.toString(),
//       "To": widget.Tofrom.toString()
//     }).then(
//           (value) => ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               backgroundColor: Colors.green,
//               content: Text("Booking is Success")
//           )
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Book Flight"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.width / 2,
//                   width: MediaQuery.of(context).size.width,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: Image(
//                       image:
//                           AssetImage("assets/london.jpg"), // Placeholder image
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // Text overlay
//                 Positioned(
//                     top: 10,
//                     right: 170,
//                     child: Text(
//                       "Trip to",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     )),
//                 Positioned(
//                   bottom: 130.0,
//                   left: 160.0,
//                   child: Text(
//                     widget.Tofrom,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10.0,
//                           color: Colors.black54,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 90.0,
//                   left: 10.0,
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.startfrom,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 10.0,
//                               color: Colors.black54,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         widget.Tofrom,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 10.0,
//                               color: Colors.black54,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 60.0,
//                   left: 10.0,
//                   child: Row(
//                     children: [
//                       Text(
//                         "Time :",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "${widget.starttime}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 10.0,
//                               color: Colors.black54,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "${widget.endtime}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 10.0,
//                               color: Colors.black54,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 10, top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Traveller Details",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "Person",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               TextButton(
//                                   onPressed: () {
//                                     decrement();
//                                   },
//                                   child: Icon(CupertinoIcons.minus))
//                             ],
//                           ),
//                           TextButton(
//                               onPressed: () {}, child: Text(item.toString())),
//                           Column(
//                             children: [
//                               TextButton(
//                                   onPressed: () {
//                                     increment();
//                                   },
//                                   child: Icon(Icons.add))
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Row(
//                     children: [Text("First & Middle Name")],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: TextField(
//                       controller: firstController,
//                       style: TextStyle(),
//                       decoration: InputDecoration(
//                           hintText: "First & Middle Name",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)))),
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Row(
//                     children: [Text("Last Name")],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: TextField(
//                       controller: secondController,
//                       style: TextStyle(),
//                       decoration: InputDecoration(
//                           hintText: "Last Name",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)))),
//                 )
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Container(
//                 padding: EdgeInsets.all(10.00),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Bill Details",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text("base fare"), Text("₹${widget.price}")],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Airline Taxes and charge"),
//                         Text("₹ 720")
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text("Convenience Fee"), Text("₹ 400")],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Grand total",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "₹ ${calculateTotalPrice()}",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 100),
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.sizeOf(context).width,
//                 color: Colors.blue,
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Total :",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "${calculateTotalPrice()}",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 90,
//                       ),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue.shade300),
//                           onPressed: () {
//                             uploadbooking();
//                           },
//                           child: Text(
//                             "Confirm Ticket",
//                             style: TextStyle(color: Colors.white),
//                           ))
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

class _BookingState extends State<Booking> {
  late List<searchmodal> searchList;
  int item = 1;
  List<TextEditingController> nameControllers = [TextEditingController()];
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  var uuid = Uuid().v1();
  var date = DateTime.now().millisecondsSinceEpoch;

  Future increment() async {
    setState(() {
      item++;
      nameControllers.add(TextEditingController()); // Add a new controller
    });
  }

  Future decrement() async {
    setState(() {
      if (item > 1) {
        item--;
        nameControllers.removeLast();
      }
    });
  }

  String calculateTotalPrice() {
    return "${(int.parse(widget.price) * item) + 720 + 400}";
  }

  // Future<void> uploadBooking() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   await firestore.collection("booking").doc(uuid).set({
  //     "first": firstController.text,
  //     "second": secondController.text,
  //     "count": item.toString(),
  //     "price": calculateTotalPrice().toString(),
  //     "from": widget.startfrom.toString(),
  //     "to": widget.Tofrom.toString()
  //   }).then(
  //     (value) => ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text("Booking is Success"),
  //       ),
  //     ),
  //   );
  // }
  // Future<void> uploadBooking() async {
  //   String first = firstController.toString();
  //   String second = secondController.toString();
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //   List<String> passengerNames = [];
  //   passengerNames.add("${firstController.text} ${secondController.text}");
  //
  //   for (int i = 1; i < item; i++) {
  //     passengerNames.add(nameControllers[i].text);
  //   }
  //
  //   // Upload data to Firestore
  //   await firestore.collection("booking").doc(uuid).set({
  //     "first": firstController.text,
  //     "second": secondController.text,
  //     "passengerNames": passengerNames, // Add all passenger names here
  //     "count": item.toString(),
  //     "price": calculateTotalPrice().toString(),
  //     "from": widget.startfrom.toString(),
  //     "to": widget.Tofrom.toString(),
  //   }).then(
  //         (value) => ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text("Booking is Success"),
  //       ),
  //     ),
  //   );
  // }
  Future<void> uploadBooking() async {
    // Check if main passenger's name fields are empty
    if (firstController.text.isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("First & Middle names cannot be empty."),
        ),
      );
      return; // Exit function if validation fails
    }

    // Check if any additional passenger name fields are empty
    for (int i = 1; i < item; i++) {
      if (nameControllers[i].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Passenger ${i + 1}'s name cannot be empty."),
          ),
        );
        return; // Exit function if validation fails
      }
    }

    // Prepare passenger names list
    List<String> passengerNames = [];
    passengerNames.add("${firstController.text} "
        // "${secondController.text}"
        );

    for (int i = 1; i < item; i++) {
      passengerNames.add(nameControllers[i].text);
    }

    // Upload data to Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("booking")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("booking")
        .doc(date.toString())
        .set({
      "first": firstController.text,
      // "second": secondController.text,
      "passengerNames": passengerNames,
      "count": item.toString(),
      "price": calculateTotalPrice().toString(),
      "from": widget.startfrom.toString(),
      "to": widget.Tofrom.toString(),
      "Starttime": widget.starttime.toString(),
      "endtime": widget.endtime.toString()
    }).then(
      (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Booking is Success"),
          ),
        );
        // Navigate to the next page on success
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Confirmbooking(
                    firstName: firstController.text,
                     // secondName: "",
                    passengerNames: passengerNames,
                    count: item,
                    price: calculateTotalPrice(),
                    from: widget.startfrom,
                    to: widget.Tofrom,
                    bookingId: date.toString(),
                starttime: widget.starttime.toString(),
                endtime : widget.endtime.toString()
                  )),
        );
      },
    ).catchError((error) {
      // Show error message if the upload fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to complete booking. Please try again."),
        ),
      );
    });
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    for (var controller in nameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Flight"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height / 1.1,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                height: MediaQuery.sizeOf(context).height / 1.2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width / 2,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                image:
                                    AssetImage("assets/london.jpg"), // Placeholder image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 170,
                              child: Text(
                                "Trip to",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              )),
                          Positioned(
                            bottom: 130.0,
                            left: 160.0,
                            child: Text(
                              widget.Tofrom,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black54,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 90.0,
                            left: 10.0,
                            child: Row(
                              children: [
                                Text(
                                  widget.startfrom,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.Tofrom,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 60.0,
                            left: 10.0,
                            child: Row(
                              children: [
                                Text(
                                  "Time :",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${widget.starttime}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.endtime}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Traveller Details",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(CupertinoIcons.minus),
                                  onPressed: decrement,
                                ),
                                Text(item.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: increment,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          // First passenger's full name (First and Last Name)
                          if (item >= 1) ...[
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [Text("First & Middle Name")],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: firstController,
                                decoration: InputDecoration(
                                  hintText: "First & Middle Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 15),
                            //   child: Row(
                            //     children: [Text("Last Name")],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.all(8.0),
                            //   child: TextField(
                            //     controller: secondController,
                            //     decoration: InputDecoration(
                            //       hintText: "Last Name",
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                          // Additional passengers' names (Single Name)
                          if (item > 1)
                            Column(
                              children: List.generate(item - 1, (index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: nameControllers[index + 1],
                                    decoration: InputDecoration(
                                      labelText: 'Passenger ${index + 2} Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Bill Details",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Base Fare"),
                                  Text("₹${widget.price}"),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Airline Taxes and Charges"),
                                  Text("₹ 720"),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Convenience Fee"),
                                  Text("₹ 400"),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Grand Total",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "₹ ${calculateTotalPrice()}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Total: ₹${calculateTotalPrice()}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                        ),
                        onPressed: () {
                          uploadBooking();
                        },
                        child: Text(
                          "Confirm Ticket",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
