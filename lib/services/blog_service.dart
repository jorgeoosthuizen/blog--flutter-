import 'dart:convert';
import 'package:blog/data_objects/post.dart';
import 'package:blog/data_objects/user.dart';
import 'package:http/http.dart' as http;

class BlogService {
  List<Post> posts = [];
  List<User> users = [];
  String baseURL = "https://jsonplaceholder.typicode.com";
  int userId = 0;

  Future<void> updatePosts(int id) async {
    userId = id;
    await getPosts();
  }

  Future<void> getPosts() async {
    String finalUrl = baseURL;
    if (userId == 0) {
      finalUrl += '/posts';
    } else {
      finalUrl += "/users/$userId/posts";
    }

    var url = Uri.parse(finalUrl);

    var response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);

    posts.clear();

    for (var i = 0; i < data.length; i++) {
      Map postFromData = data[i];
      Post post = Post(
        id: postFromData['id'],
        userId: postFromData['userId'],
        title: postFromData['title'],
        body: postFromData['body'],
      );

      posts.add(post);
    }
  }

  Future<void> getUsers() async {
    String finalUrl = "$baseURL/users";
    var url = Uri.parse(finalUrl);

    var response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);

    for (var i = 0; i < data.length; i++) {
      Map postFromData = data[i];

      User user = User(
        id: postFromData['id'],
        name: postFromData['name'],
        username: postFromData['username'],
        email: postFromData['email'],
      );

      users.add(user);
    }
  }
}
