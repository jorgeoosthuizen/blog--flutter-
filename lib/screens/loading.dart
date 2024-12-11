import 'package:blog/services/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupBlogService() async {
    BlogService bs = BlogService();
    await bs.getPosts();
    await bs.getUsers();

    Navigator.pushReplacementNamed(context, '/Blog',
        arguments: {'blogservice': bs});
  }

  @override
  void initState() {
    super.initState();
    setupBlogService();
  }

  @override
  Widget build(BuildContext context) {
    return const SpinKitSquareCircle(
      size: 200,
      color: Colors.red,
    );
  }
}
