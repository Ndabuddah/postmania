import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postmania/models/postmodels.dart';

class PostApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts({int page = 1, int limit = 10}) async {
    final response = await http.get(Uri.parse('$baseUrl/posts?_page=$page&_limit=$limit'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((post) => Post.fromJson(post)).toList().cast<Post>();

    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<String> getAuthorName(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['name'];
    } else {
      throw Exception('Failed to load author name');
    }
  }

  Future<Post> getPostDetails(int postId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$postId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Post.fromJson(data);
    } else {
      throw Exception('Failed to load post details');
    }
  }
}
