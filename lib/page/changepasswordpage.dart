import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/colors.dart';

class Changepasswordpage extends StatefulWidget {
  const Changepasswordpage({super.key});

  @override
  State<Changepasswordpage> createState() => _ChangepasswordpageState();
}

class _ChangepasswordpageState extends State<Changepasswordpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.thirdcolor,
      appBar: AppBar(
        title: Text("Changepassword"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.00),
        child: Container(
          margin: EdgeInsets.all(10.00),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter old password',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.00)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.white, // Change this to your desired color for enabled state
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add some space between the fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter New Password',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.00)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.white, // Change this to your desired color for enabled state
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add some space between the fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Confirm password',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.00)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.white, // Change this to your desired color for enabled state
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.00,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade50,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  ),
                  onPressed: () {},
                  child: Text("Change Password",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
