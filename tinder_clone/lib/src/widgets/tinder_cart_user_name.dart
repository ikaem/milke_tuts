import 'package:flutter/material.dart';

class TinderCardUserName extends StatelessWidget {
  const TinderCardUserName({
    super.key,
    required this.name,
    required this.age,
  });

  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          age,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
