import 'package:flutter/material.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 60,
        width: 170,
        color: Colors.transparent,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.thumb_up_alt_outlined),
            Icon(Icons.insert_comment_outlined),
            Icon(Icons.share),
          ],
        ),
      ),
    );
  }
}
