import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String username;
  String email;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  Card toCard({required Function() update}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ListTile(
        onTap: update,
        title: Text(
          "$name ($email)",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
        leading: const Icon(Icons.person),
      ),
    );
  }

  static Card getAllUsersCard({required Function() update}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ListTile(
        onTap: update,
        title: const Text(
          "All Users",
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
        leading: const Icon(Icons.person),
      ),
    );
  }
}


// Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               "$name ($email)",
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),