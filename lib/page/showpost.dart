import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Showpost extends StatefulWidget {
  const Showpost({super.key});

  @override
  State<Showpost> createState() => _ShowpostState();
}

class _ShowpostState extends State<Showpost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        color: Colors.red,
      ),
    );
  }
}
