import 'package:bitcontickerapp/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:rive/rive.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();
  bool isDataEmpty = true;
  //For Android Phone
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var coin in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(coin),
        value: coin,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value.toString();
            getData();
          },
        );
      },
    );
  }

  //For iOS Phone
  CupertinoPicker iOSPicker() {
    List<Text> getTextPicker = [];
    for (var coinData in currenciesList) {
      var currencyData = Text(coinData);
      getTextPicker.add(currencyData);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: getTextPicker,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  dynamic? rate;

  Future getData() async {
    var coinInfo = await coinData.getCoinData(selectedCurrency);
    rate = coinInfo;

    print(rate);
    isDataEmpty = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDataEmpty ? Colors.black : null,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text('🤑 Coin Ticker'),
        //),
        body: isDataEmpty
            ? RiveAnimation.asset('assets/rive/loadinganimation.riv')
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: [
                      CoinCard(
                        rate: rate['BTC'],
                        selectedCurrency: selectedCurrency,
                        coinInfo: 'BTC',
                      ),
                      CoinCard(
                        rate: rate['ETH'],
                        selectedCurrency: selectedCurrency,
                        coinInfo: 'ETH',
                      ),
                      CoinCard(
                        rate: rate['LTC'],
                        selectedCurrency: selectedCurrency,
                        coinInfo: 'LTC',
                      ),
                    ],
                  ),
                  Container(
                    height: 150.0,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 30.0),
                    color: Colors.lightBlue,
                    child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                  ),
                ],
              ),
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.rate,
    required this.selectedCurrency,
    required this.coinInfo,
  }) : super(key: key);

  final String rate;
  final String selectedCurrency;
  final String coinInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 35.0),
          child: Text(
            rate.isEmpty
                ? '1 $coinInfo = ? $selectedCurrency'
                : '1 $coinInfo = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
