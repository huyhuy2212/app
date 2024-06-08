import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Quang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Good Morning'),
          ],
        ),
        Icon(CupertinoIcons.bell),
        // Icon(CupertinoIcons.bell),
      ],
    );
  }
}
