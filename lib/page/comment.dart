import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Comment extends StatefulWidget {
  String postid;
  Comment({super.key, required this.postid});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  var uuid = Uuid().v1();
  TextEditingController commentController = TextEditingController();

  Future uploadcomment() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("comments")
        .doc(widget.postid)
    .collection("comments").doc(uuid)
        .set({"commentPost": commentController.text}).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("comments is upload"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              uploadcomment();
                            },
                            icon: Icon(Icons.check))),
                    controller: commentController,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
