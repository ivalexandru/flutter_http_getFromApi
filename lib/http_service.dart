import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_requests/post_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<void> deletePost(int id) async {
    Response res = await delete("$postsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      //parse the string and return the json object
      List<dynamic> body = jsonDecode(res.body);

//map over each item, map returns an iterable, that needs to be transfToList
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Cannot get posts";
    }
  }
}
