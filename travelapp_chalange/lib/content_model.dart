import 'package:travelapp_chalange/constant/constant.dart';

class OnboardingContent {
  String image;
  String title;
  String desc;
  OnboardingContent(
      {required this.image, required this.title, required this.desc});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'travel.svg',
      title: 'Discover a Hotel & Resort to Book a Suitable Room',
      desc: kLoadingPageDesc),
  OnboardingContent(
      image: 'travel_two.svg',
      title: 'Discover a Hotel & Resort to Book a Suitable Room',
      desc: kLoadingPageDesc),
];
