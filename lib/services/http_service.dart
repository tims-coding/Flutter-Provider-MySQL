import 'dart:convert';
import 'package:flutter_node_api/models/package_model.dart';
import 'package:flutter_node_api/models/post_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsUrl = "http://10.0.0.246:3002/users";

  Future<List<Post>> getPosts() async {
    Response response = await get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get the posts";
    }
  }

  Future<Post> getPost(String id) async {
    Response response =
        await get(Uri.parse("http://10.0.0.246:3002/users/$id"));

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      dynamic body = jsonDecode(response.body);

      Post post = Post.fromJson(body);

      return post;
    } else {
      throw "Can't get the posts";
    }
  }

  Future createPost(String email, String id) async {
    return await post(
      Uri.parse("http://10.0.0.246:3002/users/post"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'name': email, 'id': id, 'package': 'not set', 'guests': 0}),
    );
  }

  Future<List<Packages>> getPackages() async {
    Response response = await get(Uri.parse("$postsUrl/packages"));

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      List<dynamic> body = jsonDecode(response.body);

      List<Packages> packages =
          body.map((dynamic item) => Packages.fromJson(item)).toList();

      return packages;
    } else {
      throw "Can't get the posts";
    }
  }
}
