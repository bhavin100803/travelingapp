import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travelbuddy/page/fullscreenmode_photo.dart';
import 'package:travelbuddy/widget/login_info.dart';
import 'package:uuid/uuid.dart';

class Communitypage extends StatefulWidget {
  const Communitypage({super.key});
  @override
  State<Communitypage> createState() => _CommunitypageState();
}

// class _CommunitypageState extends State<Communitypage> {
//   String? name;
//
//   Future getname() async {
//     LocalDataSaver.getName().then((value) {
//       if (this.mounted) {
//         setState(() {
//           name = value;
//         });
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getname();
//   }
//
//   Future<void> _deletePost(String postId) async {
//     try {
//       String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
//       DocumentReference postRef = FirebaseFirestore.instance
//           .collection('posts')
//           .doc(currentUserUid)
//           .collection('posts')
//           .doc(postId);
//
//       // Delete the post
//       await postRef.delete();
//
//       print("Post deleted successfully.");
//     } catch (e) {
//       print("Error deleting post: $e");
//     }
//   }
//
//   void _savePost(DocumentSnapshot post) async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;
//     await FirebaseFirestore.instance
//         .collection('savedPosts')
//         .doc(userId)
//         .collection("savedPosts")
//         .doc(post.id)
//         .set(post.data() as Map<String, dynamic>);
//   }
//
//   void _removeSavedPost(String postId) async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;
//     await FirebaseFirestore.instance
//         .collection('savedPosts')
//         .doc(userId)
//         .collection("savedPosts")
//         .doc(postId)
//         .delete();
//   }
//
//   final DynamicLinkService _dynamicLinkService = DynamicLinkService();
//
//   void sharePost(BuildContext context, String postId, String postTitle) async {
//     Uri dynamicLink =
//         await _dynamicLinkService.createDynamicLink(postId, postTitle);
//     Share.share('Check out this post: $postTitle\n$dynamicLink');
//   }
//
//   // List<String> profileImage = [
//   //   "assets/1.jpg",
//   //   "assets/2.jpg",
//   //   "assets/3.jpg",
//   //   "assets/4.jpg",
//   //   "assets/5.jpg",
//   //   "assets/6.jpg",
//   // ];
//   // List<String> post = [
//   //   "assets/1.jpg",
//   //   "assets/2.jpg",
//   //   "assets/3.jpg",
//   //   "assets/4.jpg",
//   //   "assets/5.jpg",
//   //   "assets/6.jpg",
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Communication"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .doc(FirebaseAuth.instance.currentUser!.uid)
//             .collection("posts")
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           // Get the documents from the query snapshot
//           final List<DocumentSnapshot> post = snapshot.data!.docs;
//
//           // Display the data in a ListView
//           return ListView(
//             children: post.map((doc) {
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           child: CircleAvatar(
//                             // backgroundColor: Colors.white,
//                             radius: 11,
//                             child: Image.network(doc['postimg']),
//                           ),
//                         ),
//                         Text(
//                           "${name.toString()}",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(),
//                         IconButton(
//                             onPressed: () {
//                               _deletePost(doc.id);
//                             },
//                             icon: Icon(Icons.delete))
//                       ],
//                     ),
//                   ),
//                   // Image Row
//                   Image.network(doc['postimg']),
//                   //   Footer post
//                   Row(
//                     children: [
//                       // FavoriteButton(
//                       //     isFavorite: false,
//                       //     iconSize: 48,
//                       //     valueChanged: (_isFavorite) {}),
//                       IconButton(
//                           onPressed: () {}, icon: Icon(Icons.favorite_border)),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.chat_bubble_outline)),
//                       IconButton(
//                           onPressed: () async {
//                             // sharePost(context, "12345", "Sample Post Title");
//                             // dynamicLinkProvider().createLink("acavb").then((value){
//                             //   Share.share(value);
//                             // });
//                             // String url =
//                             //     "https://travelbuddyapp.page.link/downloads";
//                             Share.share(
//                               // await url
//                               "Check out this post: ${doc["postTitle"]}\n${doc["postDes"]}\nImage: ${doc["postimg"]}",
//                             );
//                             //  final dynamicLinkparams = DynamicLinkParameters(
//                             //    link:
//                             //        Uri.parse("https://travelbuddyapp.page/book1"),
//                             //    uriPrefix: "https://travelbuddyapp.page.link",
//                             //    androidParameters: AndroidParameters(
//                             //        packageName: "com.example.travelbuddy",
//                             //        fallbackUrl:
//                             //            Uri.parse("https://myandroidapp.link")),
//                             //    iosParameters: IOSParameters(
//                             //        bundleId: "com.example.travelbuddy",
//                             //        fallbackUrl:
//                             //            Uri.parse("https://myIosapp.link")),
//                             //  );
//                             // Uri link = await  FirebaseDynamicLinks.instance.buildLink(dynamicLinkparams);
//                             // print(link);
//                             // Share.share(link.toString());
//                           },
//                           icon: Icon(Icons.share)),
//                       Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             if (isSaved) {
//                               _removeSavedPost(doc.id); // Unsave the post
//                             } else {
//                               _savePost(doc); // Save the post
//                             }
//                           },
//                           icon: Icon(
//                             isSaved ? Icons.bookmark : Icons.bookmark_border,
//                           )),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                               style: TextStyle(
//                                   color: Colors.grey.shade700,
//                                   fontWeight: FontWeight.bold),
//                               children: [
//                                 TextSpan(text: "${doc["postTitle"]}"),
//                                 TextSpan(
//                                     text: "${doc["postDes"]}",
//                                     style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold)),
//                               ]),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//               //   ListTile(
//               //   title: Text(doc['postTitle']),
//               //   // subtitle: Text(doc['postDes']),
//               //     subtitle: Image.network(doc['postimg']),
//               // );
//
//             }).toList(),
//           );
//         },
//       ),
//     );
//
//     //     Scaffold(
//     //   appBar: AppBar(
//     //     // backgroundColor: Colors.blue.shade500,
//     //     // foregroundColor: Colors.white,
//     //     title: Text(
//     //       "Communication",
//     //       style: TextStyle(fontWeight: FontWeight.bold),
//     //     ),
//     //     actions: [
//     //       IconButton(
//     //           onPressed: () {
//     //             Navigator.push(
//     //                 context, MaterialPageRoute(builder: (_) => Searchpage()));
//     //           },
//     //           icon: Icon(Icons.search)),
//     //       Padding(
//     //         padding: const EdgeInsets.only(right: 20.0),
//     //         child: Icon(Icons.notifications),
//     //       ),
//     //     ],
//     //   ),
//     //   body: SingleChildScrollView(
//     //     child: Column(
//     //         children: List.generate(
//     //             profileImage.length,
//     //             (index) => Column(
//     //                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                   children: [
//     //                     Row(
//     //                       children: [
//     //                         Container(
//     //                           padding: EdgeInsets.all(10),
//     //                           child: CircleAvatar(
//     //                             backgroundColor: Colors.white,
//     //                             radius: 11,
//     //                             child: CircleAvatar(
//     //                               backgroundImage: AssetImage(
//     //                                   profileImage[index]), //NetworkImage
//     //                               radius: 12,
//     //                             ), //CircleAvatar
//     //                           ), //CircleAvatar
//     //                         ),
//     //                         Text("Profile name"),
//     //                         Spacer(),
//     //                         IconButton(
//     //                             onPressed: () {}, icon: Icon(Icons.more_vert))
//     //                       ],
//     //                     ),
//     //                     // Image Row
//     //                     Image.asset(post[index]),
//     //                     //   Footer post
//     //                     Row(
//     //                       children: [
//     //                         // FavoriteButton(
//     //                         //     isFavorite: false,
//     //                         //     iconSize: 48,
//     //                         //     valueChanged: (_isFavorite) {}),
//     //                         IconButton(
//     //                             onPressed: () {},
//     //                             icon: Icon(Icons.favorite_border)),
//     //                         IconButton(
//     //                             onPressed: () {},
//     //                             icon: Icon(Icons.chat_bubble_outline)),
//     //                         IconButton(
//     //                             onPressed: () async {
//     //                               // String url =
//     //                               //     "https://travelbuddyapp.page.link/downloads";
//     //                               // Share.share(await url
//     //                               //     // "Check out this post: ${doc["postTitle"]}\n${doc["postDes"]}\nImage: ${doc["postimg"]}",
//     //                               //     );
//     //                               final dynamicLinkparams =
//     //                                   DynamicLinkParameters(
//     //                                 link: Uri.parse(
//     //                                     "https://travelbuddyapp.page/post"),
//     //                                 uriPrefix:
//     //                                     "https://travelbuddyapp.page.link",
//     //                                 androidParameters: AndroidParameters(
//     //                                     packageName: "com.example.travelbuddy",
//     //                                     fallbackUrl: Uri.parse(
//     //                                         "https://myandroidapp.link")),
//     //                                 iosParameters: IOSParameters(
//     //                                     bundleId: "com.example.travelbuddy",
//     //                                     fallbackUrl:
//     //                                         Uri.parse("https://myIosapp.link")),
//     //                               );
//     //                               Uri link = await FirebaseDynamicLinks.instance
//     //                                   .buildLink(dynamicLinkparams);
//     //                               print(link);
//     //                               Share.share(link.toString());
//     //                             },
//     //                             icon: Icon(Icons.share)),
//     //                         Spacer(),
//     //                         // IconButton(
//     //                         //     onPressed: () {},
//     //                         //     icon: Icon(Icons.bookmark_border)),
//     //                       ],
//     //                     ),
//     //                     Container(
//     //                       padding: EdgeInsets.all(15),
//     //                       child: Column(
//     //                         crossAxisAlignment: CrossAxisAlignment.start,
//     //                         children: [
//     //                           // RichText(
//     //                           //   text: TextSpan(
//     //                           //        style: TextStyle(color: Colors.grey.shade700,),
//     //                           //       children: [
//     //                           //         TextSpan(text: "Liked by"),
//     //                           //         TextSpan(
//     //                           //             text: "Profile Name",
//     //                           //             style: TextStyle(
//     //                           //                 color: Colors.grey.shade700,
//     //                           //                 fontWeight: FontWeight.bold)),
//     //                           //         TextSpan(text: " and"),
//     //                           //         TextSpan(
//     //                           //             text: " others",
//     //                           //             style: TextStyle(
//     //                           //                  color: Colors.grey.shade700,
//     //                           //                 fontWeight: FontWeight.bold)),
//     //                           //       ]),
//     //                           // ),
//     //                           // RichText(
//     //                           //   text: TextSpan(
//     //                           //       // style: TextStyle(color: Colors.black),
//     //                           //       children: [
//     //                           //         TextSpan(
//     //                           //             text: "Profile Name",
//     //                           //             style: TextStyle(
//     //                           //                  color: Colors.grey.shade700,
//     //                           //                 fontWeight: FontWeight.bold)),
//     //                           //         // TextSpan(text: " This is the most amazing picture in the instagram. this is also the best cursor ever made!"),
//     //                           //       ]),
//     //                           // ),
//     //                           // Text("view all 12 comments",style: TextStyle(color: Colors.black38),)
//     //                         ],
//     //                       ),
//     //                     )
//     //                   ],
//     //                 ))),
//     //   ),
//     // );
//   }
// }

// right

// Complate code

class _CommunitypageState extends State<Communitypage> {
  String? name;
  TextEditingController commentController = TextEditingController();

  Future uploadcomment(postid) async {
    var uuid = Uuid().v1();
    String? comname;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("comments")
        .doc(postid)
        .collection("comments")
        .doc(uuid)
        .set({
      "commentPost": commentController.text,
      "id": uuid,
      "userName": name
    }).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("comments is upload"))),
    );
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

  Future getname() async {
    LocalDataSaver.getName().then((value) {
      if (this.mounted) {
        setState(() {
          name = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getname();
  }

  // Function to check if a post is saved
  Future<bool> _isPostSaved(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final savedPost = await FirebaseFirestore.instance
        .collection('savedPosts')
        .doc(userId)
        .collection('savedPosts')
        .doc(postId)
        .get();
    return savedPost.exists;
  }

  // Function to save a post
  void _savePost(DocumentSnapshot post) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('savedPosts')
        .doc(userId)
        .collection("savedPosts")
        .doc(post.id)
        .set(post.data() as Map<String, dynamic>);
  }

  // Function to remove (unsave) a post
  void _removeSavedPost(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('savedPosts')
        .doc(userId)
        .collection("savedPosts")
        .doc(postId)
        .delete();
  }

  Future<void> _toggleLike(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final postRef =
        FirebaseFirestore.instance.collection('allPost').doc(postId);
    final likeDocRef = postRef.collection('likes').doc(userId);

    final likeDoc = await likeDocRef.get();
    if (likeDoc.exists) {
      // Unlike the post
      await likeDocRef.delete();
    } else {
      // Like the post
      await likeDocRef.set({'likedAt': Timestamp.now()});
    }
  }

  Future<bool> _isPostLiked(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final likeDoc = await FirebaseFirestore.instance
        .collection('allPost')
        .doc(postId)
        .collection('likes')
        .doc(userId)
        .get();
    return likeDoc.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communication"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('allPost').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> post = snapshot.data!.docs;

          return ListView(
            children: post.map((doc) {
              return FutureBuilder<bool>(
                future: _isPostSaved(doc.id), // Check if post is saved
                builder: (context, AsyncSnapshot<bool> isSavedSnapshot) {
                  if (!isSavedSnapshot.hasData) {
                    return Container(); // Loading state
                  }

                  final bool isSaved = isSavedSnapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "${doc["userName"]}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      // Image Row
                      // Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text(
                      //     doc['country'] ?? 'Unknown Country',  // Display country name
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                      // Image.network(doc['postimg']),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            // The image
                            GestureDetector(
                              child: Image.network(
                                doc['postimg'],
                                fit: BoxFit
                                    .cover, // Ensure the image covers the space
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FullscreenPhotoPage(
                                            imageUrl: doc['postimg'])));
                              },
                            ),
                            // Country text over the image
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
                                    color:
                                        Colors.white, // White text for contrast
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: FavoriteButton(
                          //       isFavorite: false,
                          //       iconSize: 40,
                          //       valueChanged: (_isFavorite) {}),
                          // ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.favorite_border),
                          // ),
                          // IconButton(
                          //   onPressed: () {
                          //     showModalBottomSheet(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return Container(
                          //           // height: 600 ,
                          //           child: Column(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               Container(
                          //                 height: 400,
                          //                 // color: Colors.red,
                          //                 child: StreamBuilder<QuerySnapshot>(
                          //                   stream: FirebaseFirestore.instance
                          //                       .collection('comments')
                          //                       .doc(doc.id)
                          //                       .collection('comments')
                          //                       .snapshots(),
                          //                   builder: (BuildContext context,
                          //                       AsyncSnapshot<QuerySnapshot>
                          //                           snapshot) {
                          //                     if (snapshot.hasError) {
                          //                       return Center(
                          //                           child: Text(
                          //                               'Error: ${snapshot.error}'));
                          //                     }
                          //
                          //                     if (snapshot.connectionState ==
                          //                         ConnectionState.waiting) {
                          //
                          //                       return Center(
                          //                           child:
                          //                               CircularProgressIndicator());
                          //                     }
                          //
                          //                     final List<DocumentSnapshot>
                          //                         post = snapshot.data!.docs;
                          //                     return SingleChildScrollView(
                          //                       child: Container(
                          //                         margin: EdgeInsets.all(8.0),
                          //                         // color: Colors.red,
                          //                         width:
                          //                             MediaQuery.sizeOf(context)
                          //                                 .width,
                          //                         child: Column(
                          //                           crossAxisAlignment:
                          //                               CrossAxisAlignment
                          //                                   .start,
                          //                           mainAxisAlignment:
                          //                               MainAxisAlignment.start,
                          //                           children: post.map((doc) {
                          //                             return Column(
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .start,
                          //                               children: [
                          //                                 GestureDetector(
                          //                                   child: Container(
                          //                                     decoration: BoxDecoration(
                          //                                       borderRadius: BorderRadius.circular(10.0),
                          //                                     color: Colors.grey,
                          //                                     ),
                          //                                     margin:
                          //                                         EdgeInsets.all(
                          //                                             8),
                          //                                     padding:
                          //                                     EdgeInsets.all(
                          //                                         8),
                          //                                     child: Column(
                          //                                       crossAxisAlignment:
                          //                                           CrossAxisAlignment
                          //                                               .start,
                          //                                       children: [
                          //                                         Text("${doc["commentPost"]}",
                          //                                             style: TextStyle(
                          //                                               fontSize:
                          //                                               16,
                          //                                             )),
                          //                                         // RichText(
                          //                                         //   text: TextSpan(
                          //                                         //       text:
                          //                                         //           "${doc["commentPost"]}",
                          //                                         //       style: TextStyle(
                          //                                         //           fontSize:
                          //                                         //               16,
                          //                                         //          )),
                          //                                         // ),
                          //                                       ],
                          //                                     ),
                          //                                   ),
                          //                                   onLongPress: (){
                          //                                     deleteComment(
                          //                                         doc.id,
                          //                                         commentDoc.id);
                          //                                     // deleteComment();
                          //                                     // print(postId);
                          //                                     // print(doc.id);
                          //                                   },
                          //                                 ),
                          //                               ],
                          //                             );
                          //                           }).toList(),
                          //                         ),
                          //                       ),
                          //                     );
                          //                   },
                          //                 ),
                          //               ),
                          //               Container(
                          //                 child: Padding(
                          //                   padding: EdgeInsets.all(8.0),
                          //                   child: Column(
                          //                     children: [
                          //                       TextFormField(
                          //                         decoration: InputDecoration(
                          //                             hintText:
                          //                                 'Enter your comment...',
                          //                             border: OutlineInputBorder(
                          //                                 borderRadius:
                          //                                     BorderRadius
                          //                                         .circular(
                          //                                             20.0)),
                          //                             suffixIcon: IconButton(
                          //                                 onPressed: () {
                          //                                   uploadcomment(
                          //                                       doc.id);
                          //                                   commentController.clear();
                          //                                   Navigator.pop(
                          //                                       context);
                          //                                 },
                          //                                 icon: Icon(
                          //                                     Icons.send))),
                          //                         controller: commentController,
                          //                         textAlign: TextAlign.start,
                          //                         cursorColor: Colors.grey,
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         );
                          //       },
                          //     );
                          //     // Navigator.push(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //         builder: (_) => Comment(
                          //     //               postid: doc.id,
                          //     //             )));
                          //   },
                          //   icon: Icon(Icons.chat_bubble_outline),
                          // ),
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
                                        ),

                                        // Comment input
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: commentController,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter your comment...',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      uploadcomment(doc.id);
                                                      commentController.clear();
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(
                                                      Icons.send,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
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
                          Spacer(),
                          // Toggle save/unsave post
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (isSaved) {
                                  _removeSavedPost(doc.id); // Unsave the post
                                } else {
                                  _savePost(doc); // Save the post
                                }
                              });
                            },
                            icon: Icon(
                              isSaved ? Icons.bookmark : Icons.bookmark_border,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(text: "${doc["postTitle"]}"),
                                  TextSpan(
                                    text: "${doc["postDes"]}",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
