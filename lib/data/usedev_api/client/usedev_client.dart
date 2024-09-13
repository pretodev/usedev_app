import 'dart:convert';

import 'package:http/http.dart' as http;

class UsedevClient {
  Future<Map<String, dynamic>> get(String jsonUrl) async {
    final response = await http.get(Uri.parse(jsonUrl));
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
