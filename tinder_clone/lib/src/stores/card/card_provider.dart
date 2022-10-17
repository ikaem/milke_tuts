import 'package:flutter/material.dart';
import 'package:tinder_clone/src/models/user.dart';
import 'package:tinder_clone/src/utils/enums.dart';

class CardProvider extends ChangeNotifier {
  CardProvider() {
    resetUsers();
  }

  List<User> _users = [];
  Offset _position = Offset.zero;
  bool _isDragging = false;
  Size _screenSize = Size.zero;
  double _angle = 0;

  Offset get position => _position;
  bool get isDragging => _isDragging;
  Size get screenSize => _screenSize;
  double get angle => _angle;
  List<User> get users => _users;

  void resetUsers() {
    _users = mockUsers;
  }

  void setScreenSize(Size size) {
    _screenSize = size;

    notifyListeners();
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position = _position + details.delta;

// this is getting the angle
// so we get x movement
    final x = _position.dx;

    // now we calculate angle by multiplying 45 to division of x movement to width ?
    // 45 is max angle of rotation
    _angle = 45 * x / screenSize.width;

    notifyListeners();
  }

  void endPosition(DragEndDetails details) {
    _isDragging = false;
    _angle = 0;

    final status = getStatus();
    switch (status) {
      case CardStatus.like:
        {
          like();
          break;
        }
      default:
        {
          resetPosition();
        }
    }

    // resetPosition();

    notifyListeners();
  }

  void resetPosition() {
    _position = Offset.zero;
    _angle = 0.0;
  }

  CardStatus? getStatus() {
    final x = _position.dx;

    const delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    }

    if (x <= -delta) {
      return CardStatus.dislike;
    }
    return null;
  }

  void like() {
    _angle = 20;
    _position = _position + Offset(2 * _screenSize.width / 2, 0);
    _nextCard();

    // notifyListeners();
  }

  Future<void> _nextCard() async {
    // if (users.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));

    users.removeLast();
    resetPosition();

    notifyListeners();
  }
}

final List<User> mockUsers = [
  const User(
    name: "Steffi",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
  ),
  const User(
    name: "Farm",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1665969897068-1376abd5c7a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
  ),
  const User(
    name: "Nona",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1665945203723-d823de195bf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
  ),
  const User(
    name: "Card",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1665686304312-16e3a16be0ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
  ),
  const User(
    name: "Toki",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1664574654589-8f6c9b94c02d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
  ),
  const User(
    name: "Bottle",
    age: 24,
    imageUrl:
        "https://images.unsplash.com/photo-1665973250579-094c6bc6257c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80",
  ),
];
