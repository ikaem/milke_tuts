import 'package:flutter/material.dart';

class TinderActions extends StatelessWidget {
  const TinderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(
            //   shape: const CircleBorder(),
            // ),
            child: const Icon(
              Icons.clear,
              color: Colors.red,
              size: 36,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(
            //   shape: const CircleBorder(),
            // ),
            child: const Icon(
              Icons.star,
              color: Colors.blue,
              size: 36,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(
            //   shape: const CircleBorder(),
            // ),
            child: const Icon(
              Icons.favorite,
              color: Colors.green,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}
