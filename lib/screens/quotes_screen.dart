// Importations
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../controllers/quote_controller.dart';

class QuotesScreen extends StatelessWidget {
  final QuoteController _quoteController = Get.put(QuoteController());

  QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inspirational Quotes',
          style: _quoteController.appBarTitleStyle,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.quoteBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text(
                    _quoteController.quote.value,
                    style: _quoteController.quoteTextStyle,
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 10),
              Obx(() => Text(
                    "- ${_quoteController.author.value}",
                    style: _quoteController.authorTextStyle,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _quoteController.getRandomQuote,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
