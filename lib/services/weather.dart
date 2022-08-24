import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '570a6f8ea8ae542ec1ba60d771f47202';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherURL?q=$cityname&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkhelper = new NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherdata = await networkhelper.getData();

    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 26) {
      return 'ليييه حنسيح';
    } else if (temp <= 26) {
      return 'روح هات ايس كريم يطري شويه';
    } else if (temp <= 18) {
      return 'ايه التلج دا حنتجمد ولا ايه';
    } else if (temp <= 10) {
      return 'اوعي تنزل من بيتك';
    }
  }
}
