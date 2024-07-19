import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://your-api-endpoint.com';

  // LOGIN WITH GOOGLE
  Future<Map<String, dynamic>?> loginWithGoogle(String idToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/google'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idToken': idToken,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to log in with Google');
    }
  }

  // CRUD BERITA

  Future<void> addNews(String title, String content, String location, String photoUrl) async {
    final response = await http.post(
      Uri.parse('$baseUrl/news'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'content': content,
        'location': location,
        'photo_url': photoUrl,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add news');
    }
  }

  Future<void> updateNews(int newsId, String title, String content, String location, String photoUrl) async {
    final response = await http.put(
      Uri.parse('$baseUrl/news/$newsId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'content': content,
        'location': location,
        'photo_url': photoUrl,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update news');
    }
  }

  Future<void> deleteNews(int newsId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/news/$newsId'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete news');
    }
  }

  // KOMENTAR

  Future<void> addComment(int newsId, String comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/news/$newsId/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'comment': comment,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add comment');
    }
  }

  Future<List<Map<String, dynamic>>> getComments(int newsId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/news/$newsId/comments'),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load comments');
    }
  }

  // VALIDASI BERITA

  Future<void> validateNews(int newsId, bool isApproved, String? rejectionReason) async {
    final response = await http.post(
      Uri.parse('$baseUrl/news/$newsId/validate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'isApproved': isApproved,
        'rejectionReason': rejectionReason,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to validate news');
    }
  }

  // SISTEM

  Future<Map<String, dynamic>> getSystemStatus() async {
    final response = await http.get(
      Uri.parse('$baseUrl/system/status'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get system status');
    }
  }
}
