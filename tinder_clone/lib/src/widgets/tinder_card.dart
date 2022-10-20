import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/models/user.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';
import 'package:tinder_clone/src/widgets/tinder_card_view.dart';
import 'package:tinder_clone/src/widgets/tinder_status_stamp.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({super.key, required this.user, required this.isFrontCard});

  final User user;
  final bool isFrontCard;

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      final size = MediaQuery.of(context).size;

      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: !widget.isFrontCard
          ? TinderCardView(user: widget.user)
          : GestureDetector(
              onPanStart: onPanStart,
              onPanUpdate: onPanUpdate,
              onPanEnd: onPanEnd,
              child: LayoutBuilder(builder: (
                context,
                constraints,
              ) {
                final provider = Provider.of<CardProvider>(context);
                final position = provider.position;
                final isDragging = provider.isDragging;
                final angle = provider.angle;

                final milliseconds = isDragging ? 0 : 200;
                final angleInDegrees = angle * pi / 180;

                final Offset center = constraints.smallest.center(Offset.zero);

                final rotatedMatrix = Matrix4.identity()
                  ..translate(center.dx, center.dy)
                  ..rotateZ(angleInDegrees)
                  ..translate(-center.dx, -center.dy);

                return AnimatedContainer(
                  duration: Duration(milliseconds: milliseconds),
                  curve: Curves.easeInOut,
                  // this will now rotrate , but it will also move the card left and right
                  transform: rotatedMatrix..translate(position.dx, position.dy),
                  // transform: Matrix4.identity()
                  //   ..translate(
                  //     // const Offset(0, 0),
                  //     position.dx,
                  //     position.dy,
                  //   ),
                  child: Stack(
                    children: [
                      TinderCardView(user: widget.user),
                      Center(
                        // top: 20,
                        // left: 50,
                        child: Transform.rotate(
                          angle: 0.2,
                          child: const TinderStatusStamp(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
