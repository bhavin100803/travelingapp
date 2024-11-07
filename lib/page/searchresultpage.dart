import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/modal/search_modal.dart';
import 'package:travelbuddy/page/Booking.dart';

class Searchresultpage extends StatefulWidget {
  final startfrom;
  final Tofrom;
  const Searchresultpage(
      {super.key, required this.startfrom, required this.Tofrom});

  @override
  State<Searchresultpage> createState() => _SearchresultpageState();
}

class _SearchresultpageState extends State<Searchresultpage> {
  final List<Map<String, dynamic>> jsonData = [
    {
      "from": "Ahmedabad",
      "to": "Baroda",
      "duration": "abc",
      "starttime": "08:00",
      "endtime": "12:00",
      "price": "4500",
      "person": "1"
    },
    {
      "from": "baroda",
      "to": "jamnagar",
      "starttime": "09:00",
      "endtime": "13:00",
      "price": "5000",
      "person": "1"
    },
    {
      "from": "Mumbai",
      "to": "Bhavnagar",
      "starttime": "10:00",
      "endtime": "2:00",
      "price": "6000",
      "person": "1"
    },
    {
      "from": "surat",
      "to": "rajkot",
      "starttime": "03:00",
      "endtime": "6:00",
      "price": "4500",
      "person": "1"
    },
    {
      "from": "Ahmedabad",
      "to": "rajkot",
      "starttime": "06:00",
      "endtime": "10:00",
      "price": "5500",
      "person": "1"
    },
    {
      "from": "jamnagar",
      "to": "Mumbai",
      "starttime": "07:00",
      "endtime": "11:00",
      "price": "5550",
      "person": "1"
    },
    {
      "from": "surat",
      "to": "rajkot",
      "starttime": "12:00",
      "endtime": "3:00",
      "price": "4560",
      "person": "1"
    },
    {
      "from": "Ahmedabad",
      "to": "Baroda",
      "duration": "",
      "starttime": "03:00",
      "endtime": "7:00",
      "price": "4500",
      "person": "1"
    },
    {
      "from": "Ahmedabad",
      "to": "rajkot",
      "starttime": "06:00",
      "endtime": "9:00",
      "price": "5050",
      "person": "1"
    },
    {
      "from": "surat",
      "to": "rajkot",
      "starttime": "7:00",
      "endtime": "11:00",
      "price": "4560",
      "person": "1"
    },
    {
      "from": "Mumbai",
      "to": "Bhavnagar",
      "starttime": "07:00",
      "endtime": "10:00",
      "price": "6050",
      "person": "1"
    },
    {
      "from": "Mumbai",
      "to": "Ahmedabad",
      "starttime": "09:00",
      "endtime": "12:00",
      "price": "6050",
      "person": "1"
    },
    {
      "from": "Mumbai",
      "to": "Ahmedabad",
      "starttime": "07:00",
      "endtime": "10:00",
      "price": "6050",
      "person": "1"
    }
  ];

  late List<searchmodal> searchList;

  @override
  void initState() {
    super.initState();
    searchList = jsonData.map((data) => searchmodal.fromMap(data)).toList();
    searchList = jsonData
        .map((data) => searchmodal.fromMap(data))
        .where((flight) =>
            flight.from == widget.startfrom && flight.to == widget.Tofrom)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultpage",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          final flight = searchList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Booking(
                        starttime: flight.starttime ?? "N/A",
                            endtime: flight.endtime ?? "N/A",
                            Tofrom: widget.Tofrom,
                            startfrom: widget.startfrom,
                        price: flight.price ?? "N/A",
                          )));
            },
            child: Container(
              // margin: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              // Icon(Icons.location_on_sharp),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue.shade50),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${widget.startfrom}",
                                        style: TextStyle(
                                            fontSize: 18.00,
                                            color: Colors.grey.shade800),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.blue.shade50),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.Tofrom}",
                                      style: TextStyle(
                                          fontSize: 18.00,
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                   ),
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(/)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                flight.starttime ?? "N/A",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black
                                ),
                              ),
                              Text(
                                // Calculate duration based on start and end time if needed
                                "Duration",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black
                                ),
                              ),
                              Text(
                                flight.endtime ?? "N/A",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black
                                ),
                              ),
                              Text(
                                "₹ ${flight.price ?? "N/A"}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                flight.from ?? "N/A",
                                style: TextStyle(fontSize: 12, ),
                              ),
                              Text(flight.duration ?? "N/A",
                                  style:
                                  TextStyle(fontSize: 12, )),
                              // RichText(
                              //   textAlign: TextAlign.center,
                              //   text: TextSpan(
                              //     style: TextStyle(fontSize: 12, color: Colors.black),
                              //     children: [
                              //       TextSpan(text: "1h 10m\n"), // example stopover time
                              //       TextSpan(text: "Stop at Hyderabad"), // example stop location
                              //     ],
                              //   ),
                              // ),
                              Text(
                                flight.to ?? "N/A",
                                style: TextStyle(fontSize: 12, ),
                              ),
                              Text(
                                "per ${flight.person ?? "N/A"} adult",
                                style: TextStyle(fontSize: 12, ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         // color: Colors.white,
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Container(
      //             margin: EdgeInsets.all(9.0),
      //             // color: Colors.blue.shade300,
      //             width: MediaQuery.of(context).size.width,
      //             child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Column(
      //                   children: [
      //                     // Icon(Icons.location_on_sharp),
      //                     Container(
      //                       decoration: BoxDecoration(
      //                           border: Border.all(),
      //                           borderRadius: BorderRadius.circular(10.0),
      //                           color: Colors.blue.shade50),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: Text(
      //                           "${widget.startfrom}",
      //                           style: TextStyle(
      //                               fontSize: 18.00,
      //                               color: Colors.grey.shade800),
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Icon(Icons.arrow_forward_rounded),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Column(
      //                   children: [
      //                     Container(
      //                       decoration: BoxDecoration(
      //                           border: Border.all(),
      //                           borderRadius: BorderRadius.circular(10.0),
      //                           color: Colors.blue.shade50),
      //                       child: Padding(
      //                         padding: EdgeInsets.all(8.0),
      //                         child: Text(
      //                           "${widget.Tofrom}",
      //                           style: TextStyle(
      //                               fontSize: 18.00,
      //                               color: Colors.grey.shade800),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Divider(
      //         thickness: 2.0,
      //         color: Colors.black45,
      //       ),
      //       // SizedBox(height: 10,),
      //       GestureDetector(
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (_)=> Booking()));
      //         },
      //         child: Column(
      //           children: [
      //             Container(
      //               child: Container(
      //                 margin: EdgeInsets.all(10.0),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     border: Border.all(),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //                 child: Padding(
      //                   padding: EdgeInsets.all(8.0),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "8 : 15 PM",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "4h 50m",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "01.05 AM",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "₹ 5505",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           )
      //                         ],
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "Delhi",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           ),
      //                           RichText(
      //                             textAlign: TextAlign.center,
      //                             text: TextSpan(
      //                               style:
      //                               TextStyle(fontSize: 12, color: Colors.black),
      //                               children: [
      //                                 TextSpan(text: "1h 10m\n"),
      //                                 TextSpan(text: "stop at Hyderabad"),
      //                               ],
      //                             ),
      //                           ),
      //                           //  Text("1h 10m stop\n at hydrabad",style: TextStyle(fontSize: 12),),
      //                           Text(
      //                             "Mumbai",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           ),
      //                           Text(
      //                             "per adult",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           )
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               child: Container(
      //                 margin: EdgeInsets.all(10.0),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     border: Border.all(),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //                 child: Padding(
      //                   padding: EdgeInsets.all(8.0),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "8 : 15 PM",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "4h 50m",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "01.05 AM",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           ),
      //                           Text(
      //                             "₹ 5505",
      //                             style: TextStyle(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.black),
      //                           )
      //                         ],
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "Delhi",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           ),
      //                           RichText(
      //                             textAlign: TextAlign.center,
      //                             text: TextSpan(
      //                               style:
      //                                   TextStyle(fontSize: 12, color: Colors.black),
      //                               children: [
      //                                 TextSpan(text: "1h 10m\n"),
      //                                 TextSpan(text: "stop at Hyderabad"),
      //                               ],
      //                             ),
      //                           ),
      //                           //  Text("1h 10m stop\n at hydrabad",style: TextStyle(fontSize: 12),),
      //                           Text(
      //                             "Mumbai",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           ),
      //                           Text(
      //                             "per adult",
      //                             style: TextStyle(fontSize: 12, color: Colors.black),
      //                           )
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
