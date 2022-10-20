import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';
import 'package:tinder_clone/src/widgets/logo.dart';
import 'package:tinder_clone/src/widgets/tinder_actions.dart';
import 'package:tinder_clone/src/widgets/tinder_card.dart';

// const imageUrl =
//     "https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final user = const User(
  //   name: "Steffi",
  //   age: 24,
  //   imageUrl: imageUrl,
  // );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade200,
            Colors.black,
          ],
          // stops: [],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Logo(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  // child: TinderCard(user: user),
                  child: buildCardsStack(),
                ),
                const TinderActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardsStack() {
    final provider = Provider.of<CardProvider>(context);
    final users = provider.users;

    if (users.isEmpty) {
      return Center(
        child: TextButton(
          child: const Text("Reset"),
          onPressed: () {
            provider.resetUsers();
          },
        ),
      );
    }

    return Stack(
      children: users
          .map((u) => TinderCard(
                user: u,
                isFrontCard: u == users.last,
              ))
          .toList(),
    );
  }
}
