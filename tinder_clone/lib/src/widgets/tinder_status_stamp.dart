import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';
import 'package:tinder_clone/src/utils/enums.dart';

class TinderStatusStamp extends StatelessWidget {
  const TinderStatusStamp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();

    if (status == null) return const SizedBox.shrink();
    if (status == CardStatus.like) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "LIKE",
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    if (status == CardStatus.dislike) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "DISLIKE",
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "SUPERLIKE",
          style: TextStyle(
            color: Colors.green,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

// if empty, return nothing
  }
}
