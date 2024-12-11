import 'package:flutter/material.dart';

class Post {
  int id;
  int userId;
  String title;
  String body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  Card toCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              body,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
