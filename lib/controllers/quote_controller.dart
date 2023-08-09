import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/quote_service.dart';

class QuoteController extends GetxController {
  final QuoteService _quoteService = QuoteService();
  RxString quote = "Here goes the inspirational quote".obs;
  RxString author = "Unknown".obs;

  void getRandomQuote() async {
    try {
      final quotes = await _quoteService.getQuotes();
      final randomIndex = DateTime.now().millisecondsSinceEpoch % quotes.length;
      quote.value = quotes[randomIndex]['text'];
      author.value = quotes[randomIndex]['author'];
    } catch (e) {
      quote.value = "Failed to load quotes";
      author.value = "Unknown";
    }
  }

  final TextStyle quoteTextStyle = const TextStyle(
    fontSize: 24,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    letterSpacing: 1.5,
  );

  final TextStyle authorTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
  );

  final TextStyle appBarTitleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
