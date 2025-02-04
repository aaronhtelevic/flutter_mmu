import 'package:flutter/material.dart';
import 'package:flutter_mmu/types/delegate.dart';

class DelegateWidget extends StatelessWidget {
  final Delegate delegate;

  const DelegateWidget({super.key, required this.delegate});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: Colors.white),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                    "images/avatar.png"), // Assuming delegate has a meaningful toString() method
              ),
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align horizontally to start
                    children: [
                      Text(delegate.fnam.toString()),
                      Text(delegate.nam.toString()),
                    ]),
              ),
            ])));
  }
}
