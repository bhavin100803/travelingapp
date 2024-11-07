import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travelbuddy/widget/login_info.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

//
class _ProfilepageState extends State<Profilepage> {
  String? ImgUrl;
  String? email;
  String? name;
//
  @override
  void initState() {
    super.initState();
    getimag();
    getemail();
    getname();
  }

//
  Future getimag() async {
    LocalDataSaver.getImg().then((value) {
      if (this.mounted) {
        setState(() {
          ImgUrl = value;
        });
      }
    });
  }

  Future getname() async {
    LocalDataSaver.getName().then((value) {
      if (this.mounted) {
        setState(() {
          name = value;
        });
      }
    });
  }

  Future getemail() async {
    LocalDataSaver.getEmail().then((value) {
      if (this.mounted) {
        setState(() {
          email = value;
        });
      }
    });
  }
  Future deleteComment(String postId, String commentId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("comments")
        .doc(postId)
        .collection("comments")
        .doc(commentId)
        .delete()
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red, content: Text("Comment deleted"))));
  }

  void _deletePost(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(userId)
        .collection("posts")
        .doc(postId)
        .delete();
    await FirebaseFirestore.instance
        .collection("allPost")
        .doc(postId)
        .delete();
  }

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text("Profile"),
//         //   backgroundColor: Colors.blue.shade300,
//         //   foregroundColor: Colors.white,
//         // ),
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.width ,
//                 width: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                   boxShadow:  [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0.0, 2.0),
//                       blurRadius: 6.0,
//                     )
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20.0),
//                   child: Image(
//                     image: AssetImage("assets/london.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(
//               //       horizontal: 10.0, vertical: 40.0),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: <Widget>[
//               //       IconButton(
//               //         onPressed: () {
//               //           Navigator.pop(context);
//               //         },
//               //         icon: const Icon(
//               //           Icons.arrow_back,
//               //           color: Colors.white,
//               //           size: 30.0,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//                   child: Column(
//                     children: [
//                       // Profile image
//                       CircleAvatar(
//                         onBackgroundImageError: (object, StackTrace) {
//                           print("Ok");
//                         },
//                         radius: 70,
//                         backgroundImage: NetworkImage(ImgUrl.toString()),
//                       ),
//                       // Spacing between image and text
//                       SizedBox(height: 20),
//                       // Name and Email
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Name
//                           Text(
//                             "${name.toString()}",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           // Email
//                           Text(
//                             "${email.toString()}",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         children: [
//                           Text("Your Post",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Container(
//                         height: MediaQuery.sizeOf(context).height,
//                         color: Colors.grey,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header Section
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image:
                          AssetImage("assets/london.jpg"), // Placeholder image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // Profile Information Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    onBackgroundImageError: (object, StackTrace) {
                      print("Ok");
                    },
                    radius: 70,
                    backgroundImage: NetworkImage(ImgUrl.toString()),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${name.toString()}", // Replace with actual user name
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${email.toString()}", // Replace with actual user email
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Your Posts", // Section title
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                  // Placeholder for displaying user posts
                  Container(
                    height: 500,
                    // MediaQuery.sizeOf(context).height,
                    // color: Colors.grey,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('posts')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("posts")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final List<DocumentSnapshot> posts =
                            snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot doc = posts[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.0),
                                            child: Image.network(
                                          doc['userProfile'],
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.fill,
                                        )),
                                      ),
                                      Text(
                                        "${name.toString()}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(onPressed: (){
                                        _deletePost(doc.id);
                                      }, icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      // The image
                                      Image.network(
                                        doc['postimg'],
                                        fit: BoxFit
                                            .cover, // Ensure the image covers the space
                                      ),
                                      Positioned(
                                        top: 8.0, // Position the text at the top
                                        left: 8.0, // Adjust the horizontal position
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          color: doc["country"] == null
                                              ? Colors.white.withOpacity(0.01)
                                              : Colors.black.withOpacity(
                                              0.5), // Background color to make the text readable
                                          child: Text(
                                            doc['country'] ?? '',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors
                                                  .white, // White text for contrast
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Image.network(doc['postimg']),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              // height: 400,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: StreamBuilder<QuerySnapshot>(
                                                      stream: FirebaseFirestore.instance
                                                          .collection('comments')
                                                          .doc(doc.id)
                                                          .collection('comments')
                                                          .snapshots(),
                                                      builder: (BuildContext context,
                                                          AsyncSnapshot<QuerySnapshot>
                                                          snapshot) {
                                                        if (snapshot.hasError) {
                                                          return Center(
                                                              child: Text(
                                                                  'Error: ${snapshot.error}'));
                                                        }

                                                        if (snapshot.connectionState ==
                                                            ConnectionState.waiting) {
                                                          return Center(
                                                              child:
                                                              CircularProgressIndicator());
                                                        }

                                                        final List<DocumentSnapshot>
                                                        comments =
                                                            snapshot.data!.docs;

                                                        return ListView.builder(
                                                          itemCount: comments.length,
                                                          itemBuilder: (context, index) {
                                                            var commentDoc =
                                                            comments[index];

                                                            return GestureDetector(
                                                              onLongPress: () {
                                                                // Show confirmation dialog before deleting
                                                                showDialog(
                                                                  context: context,
                                                                  builder: (context) =>
                                                                      AlertDialog(
                                                                        title: Text(
                                                                            'Delete Comment?'),
                                                                        content: Text(
                                                                            'Are you sure you want to delete this comment?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(
                                                                                    context),
                                                                            child: Text(
                                                                                'Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () {
                                                                              deleteComment(
                                                                                  doc.id,
                                                                                  commentDoc
                                                                                      .id);
                                                                              print(doc.id);
                                                                              print(commentDoc
                                                                                  .id);
                                                                              Navigator.pop(
                                                                                  context);
                                                                            },
                                                                            child: Text(
                                                                                'Delete'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    margin:
                                                                    EdgeInsets.all(8),
                                                                    padding:
                                                                    EdgeInsets.all(8),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          20.0),
                                                                      color: Colors.grey
                                                                          .withOpacity(
                                                                          0.2),
                                                                    ),
                                                                    child: Column(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Text(
                                                                          "${commentDoc["userName"]}",
                                                                          style: TextStyle(
                                                                            // color:
                                                                            //     Colors.blue,
                                                                              fontSize: 10),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                          "${commentDoc["commentPost"]}",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize: 18,
                                                                            // color: Colors
                                                                            //     .grey
                                                                            //     .shade700
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.chat_bubble_outline),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        Share.share(
                                          "Check out this post: ${doc["postTitle"]}\n${doc["postDes"]}\nImage: ${doc["postimg"]}",
                                        );
                                      },
                                      icon: Icon(Icons.share),
                                    ),
                                  ],
                                ),

                                // Container(
                                //   padding: EdgeInsets.all(15),
                                //   child: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         "${doc["postTitle"]}",
                                //         style: TextStyle(
                                //           color: Colors.grey.shade700,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       Text(
                                //         "${doc["postDes"]}",
                                //         style: TextStyle(
                                //           color: Colors.grey.shade700,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//   child: Column(
//     children: [
//       Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.width / 2,
//             width: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black26,
//                   offset: Offset(0.0, 2.0),
//                   blurRadius: 6.0,
//                 )
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
//               child: Image(
//                 image: AssetImage("assets/london.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//             const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 30.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       Container(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//               child: Row(
//                 children: [
//                   // Profile image
//                   CircleAvatar(
//                     onBackgroundImageError: (object, StackTrace) {
//                       print("Ok");
//                     },
//                     radius: 70,
//                     backgroundImage: NetworkImage(ImgUrl.toString()),
//                   ),
//                   // Spacing between image and text
//                   SizedBox(width: 20),
//                   // Name and Email
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Name
//                         Text(
//                           "${name.toString()}",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 5),
//                         // Email
//                         Text(
//                           "${email.toString()}",
//                           style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// )
// gycy
// SingleChildScrollView(
//   child: Column(
//     children: [
//       Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.width / 2,
//             width: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(10.0),
//                 boxShadow: const [
//                   BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0.0, 2.0),
//                       blurRadius: 6.0)
//                 ]),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
//               child: Image(
//                 image: AssetImage(
//                   "assets/london.jpg",
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 10.0, vertical: 40.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                       size: 30.0,
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//       Container(
//         height: MediaQuery.of(context).size.height,
//          // color: Colors.blue.shade100,
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 40),
//                   child: Row(
//                     children: [
//                       Stack(
//                         children: [
//                           CircleAvatar(
//                             onBackgroundImageError: (object, StackTrace) {
//                               print("Ok");
//                             },
//                             radius: 70,
//                             backgroundImage:
//                             NetworkImage(ImgUrl.toString()),
//                           ),
//                           // CircleAvatar(
//                           //   backgroundImage: AssetImage("assets/venice.jpg"),
//                           //   radius: 70,
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 0.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "${name.toString()}",
//                         style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 0.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       "${email.toString()}",
//                       style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
