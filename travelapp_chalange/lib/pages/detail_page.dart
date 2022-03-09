import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp_chalange/constant/constant.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    double imageWidth = screenWidth >= 800 ? 350.0 : 300.0;
    double imageHeight = screenWidth >= 800 ? 320.0 : 270.0;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Appbar Here
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              spreadRadius: .2,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Icon(
                        Ionicons.arrow_back,
                        size: 20.0,
                      ),
                    ),
                    const Text(
                      "Detail",
                      style: kDetailPageTitle,
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              spreadRadius: .2,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Icon(
                        Ionicons.ellipsis_horizontal,
                        size: 21.0,
                      ),
                    ),
                  ],
                ),
              ),
              //Hotel and Resort Image
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: Expanded(
                  flex: 1,
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/hotel_image/hoteldetail.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Misty Rock Resort',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontFamily: 'TechnaSans'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Icon(
                                      Ionicons.location_outline,
                                      size: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Wayanad',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 1.0,
                                        fontFamily: 'Gordita'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 25.0, bottom: 5.0),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Ionicons.share_social_outline,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 20.0),
                                    Icon(
                                      Ionicons.heart_outline,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: const [
                  HotelDetailImages(hotelDetailImage: 'one'),
                  HotelDetailImages(hotelDetailImage: 'two'),
                  HotelDetailImages(hotelDetailImage: 'four'),
                  HotelDetailImages(
                      hotelDetailImage: 'three', hotelDetailCount: '+10'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, top: 20.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Technasans',
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        )),
                        elevation: MaterialStateProperty.all(15),
                        minimumSize:
                            MaterialStateProperty.all(const Size(100, 35)),
                        shadowColor:
                            MaterialStateProperty.all(Colors.orange.shade800),
                        backgroundColor:
                            MaterialStateProperty.all(kOrangeColorUI),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Review',
                        style: kCityNameTextStyle,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        )),
                        elevation: MaterialStateProperty.all(15),
                        minimumSize:
                            MaterialStateProperty.all(const Size(100, 35)),
                        shadowColor:
                            MaterialStateProperty.all(Colors.grey.shade300),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  kDetailPageDesc,
                  textAlign: TextAlign.center,
                  style: kLoaingPageDescTextStyle,
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 220.0),
                child: const Text(
                  'Read more...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kOrangeColorUI,
                    fontSize: 22.0,
                    fontFamily: 'Technasans',
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "\$410",
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 35.0,
                            fontFamily: 'Technasans',
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 18.0,
                            fontFamily: 'Technasans',
                            height: 1.3,
                          ),
                        ),
                        Text(
                          "Person",
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontFamily: 'Gordita',
                            height: 2.5,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Continue ->',
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
                        minimumSize:
                            MaterialStateProperty.all(const Size(200, 60)),
                        shadowColor:
                            MaterialStateProperty.all(Colors.orange.shade800),
                        backgroundColor:
                            MaterialStateProperty.all(kOrangeColorUI),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelDetailImages extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HotelDetailImages(
      {required this.hotelDetailImage, this.hotelDetailCount});
  final String hotelDetailImage;
  final String? hotelDetailCount;

  @override
  State<HotelDetailImages> createState() => _HotelDetailImagesState();
}

class _HotelDetailImagesState extends State<HotelDetailImages> {
  String? gelenDeger;

  @override
  void initState() {
    super.initState();
    if (widget.hotelDetailCount == null) {
      gelenDeger = '';
    } else {
      gelenDeger = widget.hotelDetailCount!;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rightPadding = screenWidth >= 500 ? 3.0 : 0.0;
    double leftPadding = screenWidth >= 500 ? 27.0 : 35.0;
    return Padding(
      padding: EdgeInsets.only(right: rightPadding, left: leftPadding),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: screenWidth >= 500 ? 60.0 : 50.0,
            height: screenWidth >= 500 ? 60.0 : 50.0,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/hotel_details/hotel_detail_${widget.hotelDetailImage}.png'),
            ),
          ),
          Text(
            gelenDeger!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: 'Technasans',
            ),
          ),
        ],
      ),
    );
  }
}
