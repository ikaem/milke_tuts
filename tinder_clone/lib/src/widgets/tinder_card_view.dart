import 'package:flutter/material.dart';
import 'package:tinder_clone/src/models/user.dart';
import 'package:tinder_clone/src/widgets/tinder_cart_user_name.dart';

class TinderCardView extends StatelessWidget {
  const TinderCardView({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              user.imageUrl,
            ),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          // testing with shadow linear gradient here
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.7, 1],
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("what")
              const Spacer(),
              TinderCardUserName(
                name: user.name,
                age: user.age.toString(),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 18,
                  //   color: Colors.green,
                  // ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    width: 12,
                    height: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Recently active",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
