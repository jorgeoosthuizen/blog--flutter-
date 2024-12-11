import 'package:blog/data_objects/user.dart';
import 'package:blog/services/blog_service.dart';
import 'package:flutter/material.dart';

class SetUser extends StatefulWidget {
  const SetUser({super.key});

  @override
  State<SetUser> createState() => _SetUserState();
}

class _SetUserState extends State<SetUser> {
  Map data = {};

  Future<void> updateUserIds(BlogService bs, int id) async {
    await bs.updatePosts(id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    BlogService bs = data['blogservice'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBlog - Set User"),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: bs.users.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return User.getAllUsersCard(update: () {
                    updateUserIds(bs, 0);
                  });
                } else {
                  return bs.users[index - 1].toCard(update: () {
                    updateUserIds(bs, bs.users[index - 1].id);
                  });
                }
              }),
        ),
      ]),
    );
  }
}
