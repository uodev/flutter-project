import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp_chalange/constant/constant.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:travelapp_chalange/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Ionicons.home_outline, size: 25, color: Colors.orange),
      const Icon(Ionicons.notifications_outline,
          size: 25, color: Colors.orange),
      const Icon(Ionicons.bookmark_outline, size: 25, color: Colors.orange),
      const Icon(Ionicons.person_outline, size: 25, color: Colors.orange),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        height: 50.0,
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //User Appbar Widget
                const PersonUIWidget(),
                //Find Your Stay Text
                const Text(
                  'Find Your Stay',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'TechnaSans',
                  ),
                ),
                const SizedBox(height: 20.0),
                //Search ve OptionIcon Part
                const SearchAndOptionWidget(),
                //City and Country Part
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: Row(
                      children: const [
                        CityWidget(cityName: "India", cityImage: 'india'),
                        CityWidget(cityName: 'Newyork', cityImage: 'newyork'),
                        CityWidget(
                            cityName: 'Australia', cityImage: 'australia'),
                        CityWidget(cityName: 'Poland', cityImage: 'poland'),
                        CityWidget(cityName: "India", cityImage: 'india'),
                        CityWidget(cityName: 'Newyork', cityImage: 'newyork'),
                        CityWidget(
                            cityName: 'Australia', cityImage: 'australia'),
                        CityWidget(cityName: 'Poland', cityImage: 'poland'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                //Our Prop and View All Part
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Our Properties',
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontFamily: 'TechnaSans',
                          fontSize: 23.0,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xffF05A22),
                          fontSize: 16.0,
                          fontFamily: 'Gordita',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                //Hotel and Resort Part
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      HotelWidget(),
                      HotelWidget(),
                      HotelWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                //Popular and View All Text Here
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Popoular',
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontFamily: 'TechnaSans',
                          fontSize: 23.0,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xffF05A22),
                          fontSize: 16.0,
                          fontFamily: 'Gordita',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                //Popoular Hotel and Resort Widget Here
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                    child: Row(
                      children: const [
                        PopoularHotel(),
                        PopoularHotel(),
                        PopoularHotel(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchAndOptionWidget extends StatelessWidget {
  const SearchAndOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SearchWidget(),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                colors: [
                  Color(0xffF05A22),
                  Color(0xffF78E48),
                ],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
              ),
            ),
            child: const Icon(
              Ionicons.options_outline,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class PersonUIWidget extends StatelessWidget {
  const PersonUIWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profil_photo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 3.0),
                child: Text(
                  'Hello, ',
                  style: TextStyle(
                    height: 1.35,
                  ),
                ),
              ),
              Text(
                'Niara!',
                style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'TechnaSans',
                  color: kOrangeColorUI,
                ),
              ),
            ],
          ),
          const Icon(
            Ionicons.notifications_outline,
            size: 30.0,
            color: kOrangeColorUI,
          ),
        ],
      ),
    );
  }
}

class PopoularHotel extends StatelessWidget {
  const PopoularHotel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const DetailPage()));
        },
        child: Container(
          width: 300,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/hotel_image/beach_one.png',
                alignment: AlignmentDirectional.topCenter,
                scale: 1.2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Misty Rock Resort',
                      style: TextStyle(
                        color: Color(0xff292931),
                        fontFamily: 'TechnaSans',
                        fontSize: 16.0,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Ionicons.location_outline,
                          size: 17.0,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Wayanad',
                          style: TextStyle(
                            color: Color(0xff898989),
                            fontFamily: 'Gordita',
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/com_one.png',
                              scale: .9,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Image.asset(
                                'assets/images/com_two.png',
                                scale: .9,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                'assets/images/com_three.png',
                                scale: .9,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset(
                                    'assets/images/com_con.png',
                                    scale: .9,
                                  ),
                                  const Text(
                                    "+49",
                                    style: TextStyle(
                                      fontSize: 9.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          '52 reviews',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff292931),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DetailPage()),
          );
        },
        child: Container(
          width: 250.0,
          height: 220.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/hotel_image/beach_one.png',
                alignment: AlignmentDirectional.topCenter,
                scale: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Misty Rock Resort',
                          style: TextStyle(
                            color: Color(0xff292931),
                            fontFamily: 'TechnaSans',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35.0, top: 5.0),
                        child: Text(
                          'Wayanad',
                          style: TextStyle(
                            color: Color(0xff898989),
                            fontFamily: 'Gordita',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffF05A22),
                            Color(0xffF78E48),
                          ],
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: const Icon(
                        Ionicons.chevron_forward_outline,
                        size: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityWidget extends StatelessWidget {
  const CityWidget({
    Key? key,
    required this.cityName,
    required this.cityImage,
  }) : super(key: key);
  final String cityName;
  final String cityImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Column(
        children: [
          SizedBox(
            width: 45.0,
            height: 45.0,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/country_image/${cityImage}_ct.png'),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            cityName,
            style: kCityNameTextStyle,
          )
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 270.0,
      height: 50.0,
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: TextField(
          cursorColor: kOrangeColorUI,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Ionicons.search_outline,
              color: kOrangeColorUI,
              size: 22.0,
            ),
            hintText: 'Search Here...',
            hintStyle: TextStyle(
              color: kOrangeColorUI,
              fontFamily: 'TechnaSans',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: kOrangeColorUI),
            ),
          ),
        ),
      ),
    );
  }
}
