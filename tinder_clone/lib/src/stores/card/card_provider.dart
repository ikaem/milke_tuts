import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  final Offset _position = Offset.zero;

  Offset get position => _position;

  void startPosition(DragStartDetails details) {}
  void updatePosition(DragUpdateDetails details) {}
  void endPosition(DragEndDetails details) {}
}
