import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/colors.dart';
import 'package:travelbuddy/page/homepage.dart';

class Termsconditionpage extends StatefulWidget {
  const Termsconditionpage({super.key});

  @override
  State<Termsconditionpage> createState() => _TermsconditionpageState();
}

class _TermsconditionpageState extends State<Termsconditionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.my_Primariycolor,
        foregroundColor: Colors.white,
        title: Text("Terms & Conditions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ],
                    // color: Colors.blueAccent, // Add background color for visibility
                  ),
                ),
                // Positioned widget to place text on top of the container
                Positioned(
                  left: 90.0,
                  bottom: 70.0,
                  child: Text(
                    'Terms & Condition',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
              color: color.thirdcolor,
                borderRadius: BorderRadius.circular(20.0)
              ),
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          " By accessing and using our services, you agree to comply with these terms and conditions. If you do not agree with any part of the terms, you may not use our services.",
                          style: TextStyle(fontSize: 24,color: Colors.white),
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              " If any provision of these terms is deemed unlawful, void, or unenforceable, that provision shall be considered severable and shall not affect the validity and enforceability of the remaining provisions.",
                              style: TextStyle(fontSize: 24,color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              " You agree to indemnify and hold harmless [Company Name] and its affiliates from any claims, damages, losses, or expenses arising from your use of the services, violation of these terms, or infringement of any third-party rights.",
                              style: TextStyle(fontSize: 24,color: Colors.white),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
