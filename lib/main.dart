import 'package:blog/screens/blog.dart';
import 'package:blog/screens/loading.dart';
import 'package:blog/screens/set_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/Blog': (context) => const Blog(),
      '/SetUser': (context) => const SetUser(),
    },
  ));
}
