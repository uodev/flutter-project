import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelapp_chalange/constant/constant.dart';
import 'package:travelapp_chalange/content_model.dart';
import 'package:travelapp_chalange/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    double imageWidth = screenWidth >= 800 ? 400 : 210;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 40.0),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/${contents[i].image}',
                          width: imageWidth),
                      const SizedBox(height: 20.0),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: kLoadingPageTextStyle,
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: 300.0,
                        child: Text(
                          contents[i].desc,
                          textAlign: TextAlign.center,
                          style: kLoaingPageDescTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            child: currentIndex == contents.length - 1 ? skipButton() : null,
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  ElevatedButton skipButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      },
      child: const Text(
        'Get Started\t->',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontFamily: 'Technasans',
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        )),
        elevation: MaterialStateProperty.all(15),
        minimumSize: MaterialStateProperty.all(const Size(200, 45)),
        shadowColor: MaterialStateProperty.all(Colors.orange.shade800),
        backgroundColor: MaterialStateProperty.all(kOrangeColorUI),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kOrangeColorUI,
      ),
    );
  }
}
