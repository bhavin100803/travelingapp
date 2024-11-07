import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Savepost extends StatefulWidget {
  const Savepost({super.key});

  @override
  State<Savepost> createState() => _SavepostState();
}

class _SavepostState extends State<Savepost> {
  void _removeSavedPost(String postId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('savedPosts')
        .doc(userId)
        .collection("savedPosts")
        .doc(postId)
        .delete();
  }

  void _savePost(DocumentSnapshot post) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('savedPosts')
        .doc(userId)
        .collection("savedPosts")
        .doc(post.id)
        .set(post.data() as Map<String, dynamic>);
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Saved Posts"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('savedPosts')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("savedPosts")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final List<DocumentSnapshot> savedPosts = snapshot.data!.docs;

            return ListView(
              children: savedPosts.map((doc) {
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
                          // Display the post image in full width
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
                                        color: Colors
                                            .white, // White text for contrast
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Image.network(
                          //   doc['postimg'],
                          //   fit: BoxFit
                          //       .cover, // Ensures the image covers the available space
                          //   width: MediaQuery.sizeOf(context)
                          //       .width, // Makes the image as wide as the screen
                          //   height: 500,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Ensures title, subtitle, and icon are spaced evenly
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                                        child: StreamBuilder<
                                                            QuerySnapshot>(
                                                          stream:
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'comments')
                                                                  .doc(doc.id)
                                                                  .collection(
                                                                      'comments')
                                                                  .snapshots(),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<
                                                                      QuerySnapshot>
                                                                  snapshot) {
                                                            if (snapshot
                                                                .hasError) {
                                                              return Center(
                                                                  child: Text(
                                                                      'Error: ${snapshot.error}'));
                                                            }

                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            }

                                                            final List<
                                                                    DocumentSnapshot>
                                                                comments =
                                                                snapshot
                                                                    .data!.docs;

                                                            return ListView
                                                                .builder(
                                                              itemCount:
                                                                  comments
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                var commentDoc =
                                                                    comments[
                                                                        index];

                                                                return GestureDetector(
                                                                  onLongPress:
                                                                      () {
                                                                    // Show confirmation dialog before deleting
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              AlertDialog(
                                                                        title: Text(
                                                                            'Delete Comment?'),
                                                                        content:
                                                                            Text('Are you sure you want to delete this comment?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(context),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              deleteComment(doc.id, commentDoc.id);
                                                                              print(doc.id);
                                                                              print(commentDoc.id);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('Delete'),
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
                                                                              BorderRadius.circular(20.0),
                                                                          color: Colors
                                                                              .grey
                                                                              .withOpacity(0.2),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
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
                                                                              style: TextStyle(
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
                                    Text(
                                      doc['postTitle'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      doc['postDes'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                // The bookmark icon at the end
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isSaved) {
                                        _removeSavedPost(
                                            doc.id); // Unsave the post
                                      } else {
                                        // _savePost(doc); // Save the post
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isSaved
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }).toList(),
            );
          },
        )
        // StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance
        //       .collection('savedPosts')
        //       .doc(FirebaseAuth.instance.currentUser!.uid)
        //       .collection("savedPosts")
        //       .snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //
        //     final List<DocumentSnapshot> savedPosts = snapshot.data!.docs;
        //
        //     return ListView(
        //       children: savedPosts.map((doc) {
        //         return ListTile(
        //           leading: CircleAvatar(
        //             backgroundImage: NetworkImage(doc['postimg']),
        //           ),
        //           title: Text(doc['postTitle']),
        //           subtitle: Text(doc['postDes']),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
        );
  }
}
