import 'dart:convert';

import 'package:http/http.dart' as http;

class UsedevClient {
  final _baseUrl = 'https://gist.githubusercontent.com/viniciosneves';

  Future<Map<String, dynamic>> get(String path) async {
    final url = '$_baseUrl$path';
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}


// https://gist.githubusercontent.com/viniciosneves/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json
// https://gist.githubusercontent.com/viniciosneves/946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json