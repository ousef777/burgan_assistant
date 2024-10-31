import 'package:flutter/material.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class RealstockProvider extends ChangeNotifier {
  double price = 0.0;
  Future<void> getStock() async {
    YahooFinanceResponse response =
        await YahooFinanceDailyReader().getDailyDTOs('GOOG');
    print(response.candlesData.last.adjClose);
  }
}
