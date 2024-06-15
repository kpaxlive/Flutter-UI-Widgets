import 'package:flutter/material.dart';

class Segment extends StatefulWidget {
  final double segmentHeight;
  final double segmentWidth;
  final String segmentText;
  final Color colorize;

  const Segment(
      {super.key,
      required this.segmentHeight,
      required this.segmentWidth,
      required this.segmentText,
      required this.colorize});

  @override
  State<Segment> createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.segmentHeight,
      width: widget.segmentWidth,
      decoration: BoxDecoration(color: widget.colorize, boxShadow: [
        for (double i = 0; i < 5; i++)
          BoxShadow(
              color: Colors.white,
              spreadRadius: -1,
              blurRadius: 7 * i,
              blurStyle: BlurStyle.outer)
      ]),
      child: Center(child: Text(widget.segmentText)),
    );
  }
}
