import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelbuddy/page/searchresultpage.dart';

class Searchpage extends StatefulWidget {
  Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  DateTime? _selectedDate;
  DateTime? _selectedendDate;

  TextEditingController FromController = TextEditingController();
  TextEditingController toController = TextEditingController();


  // Function to show the date picker and get the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      // Navigate to the date details page after selecting a date
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DateDetailsPage(date: _selectedDate!),
      //   ),
      // );
    }
  }

  Future<void> _selectendDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedendDate) {
      setState(() {
        _selectedendDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('dd MM yyyy').format(_selectedDate!);
    // String formattedDate1 = DateFormat('dd MM yyyy').format(_selectedendDate!);
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // foregroundColor: Colors.white,
          title: Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // backgroundColor: Colors.blue.shade300,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.grey
                  ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 10.00, left: 10.00),
                          child: TextField(
                            // textInputAction: TextInputAction.search,
                            controller: FromController,
                            style: TextStyle(
                                // color: Colors.white
                                ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              hintText: "From",
                              hintStyle: TextStyle(
                                  // color: color.white.withOpacity(0.5),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 10.00, left: 10.00),
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            controller: toController,
                            style: TextStyle(
                                // color: Colors.white
                                ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(30.00)),
                              hintText: "To",
                              hintStyle: TextStyle(
                                  // color: color.white.withOpacity(0.5),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Text(
                              'Select Start Date',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Selected Date:  ${_selectedDate != null ? DateFormat('dd MM yyyy').format(_selectedDate!) : "10 8 2022"}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => _selectendDate(context),
                            child: Text(
                              'Select End Date',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'End Date: ${_selectedendDate != null ? DateFormat('dd MM yyyy').format(_selectedendDate!) : ""}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.00,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tokyo",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Manali",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Goa",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Hyderabad",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rishikesh",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Haridvar",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Dwarka",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Ahemedabad",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            shadowColor: Colors.black, // Shadow color
                            elevation: 5, // Elevation (shadow)
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15), // Button padding
                            shape: RoundedRectangleBorder(
                              // Rounded corner shape
                              borderRadius:
                                  BorderRadius.circular(20), // Circular corners
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Searchresultpage(
                                          startfrom: FromController.text,
                                          Tofrom: toController.text,
                                        )));
                          },
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
