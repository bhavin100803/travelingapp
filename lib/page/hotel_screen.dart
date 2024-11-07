import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/modal/activity_modal.dart';
import 'package:travelbuddy/modal/hotel_modal.dart';

class HotelScreen extends StatefulWidget {
   final Hotel hotel;
  HotelScreen({super.key, required this.hotel});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                child: Hero(
                  tag: widget.hotel.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.hotel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30.0,
                        )),
                    Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30.0,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   widget.hotel.city,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 24.0,
                    //     fontWeight: FontWeight.w600,
                    //     letterSpacing: 1.2,
                    //   ),
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     Text(
                    //       widget.destination.country,
                    //       style: TextStyle(color: Colors.white, fontSize: 20.0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0,bottom: 15.0),
                itemCount: widget.hotel.activities1.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.hotel.activities1[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price}',
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // Text(
                                      //   'Per Pax',
                                      //   style: TextStyle(color: Colors.grey),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                              Text(activity.type,style: TextStyle(color: Colors.black),),
                              // _buildRatingStars(activity.rating),
                              SizedBox(
                                height: 15.00,
                              ),
                              Row(
                                children: [
                                  // Container(
                                  //   // padding: EdgeInsets.all(5.0),
                                  //   width: 70.0,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.lightBlueAccent,
                                  //       borderRadius:
                                  //       BorderRadius.circular(10.0)),
                                  //   alignment: Alignment.center,
                                  //   child: Text(activity.startTimes[0]),
                                  // ),
                                  // SizedBox(
                                  //   width: 10.0,
                                  // ),
                                  // Container(
                                  //   width: 70.0,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.lightBlueAccent,
                                  //       borderRadius:
                                  //       BorderRadius.circular(10.0)),
                                  //   alignment: Alignment.center,
                                  //   child: Text(activity.startTimes[1]),
                                  // )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30.0,
                        top: 5.0,
                        bottom: 5.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 100.0,
                            image: AssetImage(activity.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
