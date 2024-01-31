import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SongInList extends StatelessWidget {
  final int index;
  final String name;
  const SongInList({super.key, required this.index, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Row(
        children: [
          Text(
            '$index.',
            style: const TextStyle(color: Colors.amber),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      const SizedBox(width: 20.0,),
      const Row(
        children: [
          SizedBox(
            child: LikeButton(),
          ),
          SizedBox(
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      )
    ]);
  }
}
