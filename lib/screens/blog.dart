import 'package:blog/services/blog_service.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    BlogService bs = data['blogservice'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBlog"),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: Column(children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/SetUser',
                arguments: {'blogservice': bs});
          },
          child: const Text("Set User"),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: bs.posts.length,
            itemBuilder: (context, index) => bs.posts[index].toCard(),
          ),
        ),
      ]),
    );
  }
}
