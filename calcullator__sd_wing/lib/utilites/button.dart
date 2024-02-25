import 'package:flutter/material.dart';

class Mbutton extends StatelessWidget {
  final String text;
  final bool operator;
  final VoidCallback? onPressed;

  const Mbutton({
    Key? key,
    required this.text,
    required this.operator,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: operator ? Colors.blueAccent : const Color.fromARGB(255, 249, 249, 249),
          shape: const CircleBorder(),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.21, MediaQuery.of(context).size.width * 0.21),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
    );
  }
}

class Specialbutton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final VoidCallback? onPressed;

  const Specialbutton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 20,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          fixedSize: Size(width, height),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: MediaQuery.of(context).size.width * 0.07),
        ),
      ),
    );
  }
}

