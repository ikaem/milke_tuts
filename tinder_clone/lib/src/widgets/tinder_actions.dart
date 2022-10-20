import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';
import 'package:tinder_clone/src/utils/enums.dart';

class TinderActions extends StatelessWidget {
  const TinderActions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              provider.dislike();
            },
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
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  status == CardStatus.superlike ? Colors.blue.shade200 : null,
            ),
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
