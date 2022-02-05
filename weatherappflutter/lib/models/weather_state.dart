class WeatherState {
  //['weather'][0]['id']
  var bgImage = '';

  void backGroundImage(int condition) {
    print(condition);

    if (condition < 233) {
      bgImage = 'bgstorm';
    } else if (condition < 322) {
      bgImage = 'bgdrizzle';
    } else if (condition < 532) {
      bgImage = 'bgrain';
    } else if (condition < 623) {
      bgImage = 'bgsnow';
    } else if (condition < 782) {
      print('ATMOSPHERE');
      bgImage = 'bgwarm';
    } else if (condition == 800) {
      bgImage = 'bghot';
    } else if (condition < 805) {
      print('CLOUDS');
      bgImage = 'bgcloud';
    }
  }
}
