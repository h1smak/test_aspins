import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiProvider {
  final String apiUrl;

  ApiProvider(this.apiUrl);

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
