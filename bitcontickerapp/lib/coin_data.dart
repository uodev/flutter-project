import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'TRY'
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = 'BDE7DCF9-F69B-4319-BB9C-DB4E87DAAEB2';

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Map<String, String> cryptoPrices = {};
  Future<dynamic> getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      String url = '$coinAPIURL$crypto/$selectedCurrency?apikey=$apiKey';
      var uri = Uri.parse(url);

      http.Response response = await http.get(uri);
      var coinInfo = jsonDecode(response.body);
      double lastPrice = coinInfo['rate'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
