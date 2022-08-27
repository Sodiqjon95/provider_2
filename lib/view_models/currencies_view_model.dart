import 'package:flutter/material.dart';
import '../data_layer/models/currency_item.dart';
import '../data_layer/repository/currency_repository.dart';

class CurrencyViewModel extends ChangeNotifier {
  CurrencyViewModel({required this.currencyRepository});

  final CurrencyRepository currencyRepository;

  List<CurrencyItem> currencyItems = [];

  bool isLoading = false;

  void fetchCurrencyList() async {
    isLoading = true;
    notifyListeners();

    currencyItems = await currencyRepository.getAllCurrencies();
    isLoading = false;
    notifyListeners();
  }
}