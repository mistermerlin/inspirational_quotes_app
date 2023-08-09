import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  final String baseUrl = "https://type.fit/api/quotes";

  Future<List<Map<String, dynamic>>> getQuotes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data.map((quote) {
        return {
          'text': quote['text'],
          'author': quote['author'] ??
              'Unknown', // Certains quotes n'ont pas d'auteur
        };
      }));
    } else {
      throw Exception("Failed to load quotes");
    }
  }
}
