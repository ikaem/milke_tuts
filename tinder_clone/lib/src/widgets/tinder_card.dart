import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/models/user.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';
import 'package:tinder_clone/src/widgets/tinder_card_view.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: () {
          log("what is up?");
        },
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: TinderCardView(user: widget.user),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    provider.startPosition(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    provider.updatePosition(details);
  }

  void onPanEnd(DragEndDetails details) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    provider.endPosition(details);
  }
}
